AddCSLuaFile()

net.Receive( "CFC9k_BonkGun_PlayTweakedSound", function()
    local pos = net.ReadVector()
    local path = net.ReadString()
    local volume = net.ReadFloat()
    local pitch = net.ReadFloat()

    -- sound.PlayFile doesn't properly cut off distant sounds
    if EyePos():Distance( pos ) > 1000 then return end

    sound.PlayFile( "sound/" .. path, "3d stereo noblock noplay", function( station )
        if not IsValid( station ) then return end

        station:SetPos( pos )
        station:SetVolume( volume )
        station:SetPlaybackRate( pitch )
        station:Play()
    end )
end )

if CLIENT then return end


util.AddNetworkString( "CFC9k_BonkGun_PlayTweakedSound" )


local bonkedEnts = {}

local IMPACT_ACCELERATION_THRESHOLD = 7000
local IMPACT_START_DELAY = 0.07
local IMPACT_LIFETIME = 6
local AIR_SHOT_REFUND_COOLDOWN = 0.01

local IsValid = IsValid
local VECTOR_ZERO = Vector( 0, 0, 0 )


local function mathSign( x )
    if x > 0 then return 1 end
    if x < 0 then return -1 end
    return 0
end

local function isBuildPlayer( ply )
    if not ply:IsPlayer() then return false end
    if not ply.IsInBuild then return false end
    return ply:IsInBuild()
end

local function enoughToKill( ply, dmgAmount )
    local health = ply:Health()
    local armor = ply:IsPlayer() and ply:Armor() or 0

    -- Note: this currently doesn't check for godmode
    if dmgAmount >= health + armor then
        return true
    end

    return false
end

local function playTweakedSound( ent, path, volume, pitch )
    if not IsValid( ent ) then return end
    if not path then return end

    local pos = ent:WorldSpaceCenter()
    volume = volume or 1
    pitch = pitch or 1

    -- Volume can't be set higher than 1 without using sound.PlayFile on client
    net.Start( "CFC9k_BonkGun_PlayTweakedSound" )
        net.WriteVector( pos )
        net.WriteString( path )
        net.WriteFloat( volume )
        net.WriteFloat( pitch )
    net.Broadcast()
end

local function playBonkSound( victim )
    local pitchOffset = math.Rand( -0.1, 0.1 )

    playTweakedSound( victim, "garrysmod/balloon_pop_cute.wav", 1.25, 0.7 + pitchOffset )
    playTweakedSound( victim, "physics/glass/glass_sheet_impact_hard1.wav", 1.25, 1.8 + pitchOffset )
end

local function playBonkImpactSound( attacker, victim )
    playTweakedSound( victim, "physics/flesh/flesh_impact_bullet" .. math.random( 1, 5 ) .. ".wav", 1.25, 1 )

    if attacker and attacker:IsPlayer() then
        attacker:EmitSound( "npc/headcrab_poison/ph_wallhit2.wav", 50, 100, 1 )
    end
end

-- Refunds a single shot of ammo if the victim is in the air due to being bonked
local function refundAirShot( attacker, victim, wep )
    if not AIR_SHOTS_REFUND_AMMO then return end
    if attacker.cfc9k_bonkCannotRefund then return end
    if not IsValid( wep ) then return end
    if victim:IsOnGround() then return end

    local bonkInfo = victim.cfc9k_bonkInfo or {}
    if not bonkInfo.IsBonked then return end

    local amountToRefund = wep.Bonk.AirShotsRefundAmmo
    if not amountToRefund or amountToRefund <= 0 then return end

    local clipAmmo = wep:Clip1()
    local clipMax = wep.Primary.ClipSize
    if clipAmmo >= clipMax then return end

    local newClipAmmount = math.min( clipAmmo + amountToRefund, clipMax )
    wep:SetClip1( newClipAmmount )
    attacker.cfc9k_bonkCannotRefund = true -- Only refund once per shot, so shooting two players doesn't give extra ammo

    timer.Simple( AIR_SHOT_REFUND_COOLDOWN, function()
        if not IsValid( attacker ) then return end
        attacker.cfc9k_bonkCannotRefund = false
    end )
end

local function counteractOpposingVelocity( ply, forceDir )
    local plyVel = ply:GetVelocity()
    local dot = plyVel:Dot( forceDir )

    if dot >= 0 then return VECTOR_ZERO end

    return -dot * forceDir
end

local function getBonkForce( victim, wep, dmgForce, dmgAmount, fromGround )
    local maxDamage = wep.Primary.Damage * wep.Primary.NumShots
    local damageMult = math.min( dmgAmount / maxDamage, wep.Bonk.PlayerForceMultMax )
    local bonkInfo = victim.cfc9k_bonkInfo or {}

    if bonkInfo.IsBonked then
        damageMult = damageMult * wep.Bonk.PlayerForceComboMult
    end

    if damageMult < wep.Bonk.PlayerForceIgnoreThreshold then return false end

    dmgForce = dmgForce:GetNormalized() -- Normalize without modifying original argument

    if victim:IsPlayer() then
        if fromGround then
            local z = dmgForce.z
            z = z * wep.Bonk.PlayerForceGroundZMult + wep.Bonk.PlayerForceGroundZAdd
            dmgForce.z = z
            dmgForce:Normalize()
        else
            local z = dmgForce.z
            z = z * wep.Bonk.PlayerForceAirZMult + mathSign( z ) * wep.Bonk.PlayerForceAirZAdd
            dmgForce.z = z
            dmgForce:Normalize()

            damageMult = damageMult * wep.Bonk.PlayerForceAirMult
        end
    else
        if fromGround then
            dmgForce.z = math.abs( dmgForce.z )
            dmgForce.x = dmgForce.x * wep.Bonk.NPCForceGroundHorizontalMult
            dmgForce.y = dmgForce.y * wep.Bonk.NPCForceGroundHorizontalMult
        end

        dmgForce = dmgForce * wep.Bonk.NPCForceMult
    end

    local counterForce = counteractOpposingVelocity( victim, dmgForce ) * wep.Bonk.PlayerForceCounteractMult
    local forceStrength = wep.Bonk.PlayerForce * damageMult + wep.Bonk.PlayerForceAdd
    local force = dmgForce * forceStrength + counterForce

    if fromGround then
        force.z = math.max( force.z, wep.Bonk.PlayerForceGroundZMin )
    end

    return force
end

local function bonkPlayerOrNPC( attacker, victim, wep, force )
    if not force then return end

    if victim:IsPlayer() then
        victim:SetVelocity( force )
    else
        victim:SetVelocity( victim:GetVelocity() + force )
    end

    playBonkSound( victim )

    if not wep.Bonk.ImpactEnabled then return end
    local wepClass = wep:GetClass()

    timer.Simple( IMPACT_START_DELAY, function()
        if not IsValid( victim ) then return end

        local bonkInfo = victim.cfc9k_bonkInfo

        if not bonkInfo then
            bonkInfo = {}
            victim.cfc9k_bonkInfo = bonkInfo
        end

        bonkInfo.Attacker = attacker
        bonkInfo.PrevVel = victim:GetVelocity()
        bonkInfo.IsBonked = true
        bonkInfo.ExpireTime = RealTime() + IMPACT_LIFETIME
        bonkInfo.Weapon = wep
        bonkInfo.WeaponClass = wepClass
        bonkedEnts[victim] = true
    end )
end

local function bonkVictim( attacker, victim, dmg, wep )
    local dmgForce = dmg:GetDamageForce()

    if IsValid( victim ) and ( victim:IsPlayer() or victim:IsNPC() ) then
        local dmgAmount = dmg:GetDamage()
        local fromGround = victim:IsOnGround()

        -- When the victim is on the ground, dmgForce is pointed downwards, which makes the launch weak
        if fromGround then
            dmgForce.z = math.abs( dmgForce.z )
        end

        refundAirShot( attacker, victim, wep )

        if enoughToKill( victim, dmgAmount ) then
            -- Death ragdoll only needs a force multiplier
            dmg:SetDamageForce( dmgForce * wep.Bonk.PlayerForceMultRagdoll )
        else
            local force = getBonkForce( victim, wep, dmgForce, dmgAmount, fromGround )

            bonkPlayerOrNPC( attacker, victim, wep, force )
        end
    else
        dmg:SetDamageForce( dmgForce * wep.Bonk.PropForceMult )
    end
end

local function handleImpact( ent, accel )
    local bonkInfo = ent.cfc9k_bonkInfo
    local attacker = IsValid( bonkInfo.Attacker ) and bonkInfo.Attacker or game.GetWorld()
    local wep = bonkInfo.Weapon

    if not IsValid( wep ) then
        wep = cfcEntityStubber.getWeapon( bonkInfo.WeaponClass )
    end

    local damageMult = wep.Bonk.ImpactDamageMult
    local damageMin = wep.Bonk.ImpactDamageMin
    local damageMax = wep.Bonk.ImpactDamageMax
    local damage = math.Clamp( accel * damageMult, damageMin, damageMax )

    if not IsValid( wep ) then
        wep = attacker
    end

    if not ent:IsOnGround() then
        playBonkImpactSound( attacker, ent )
    end

    -- Setting the inflictor to wep ensures a proper killfeed icon, and prevents the bonk effect from re-applying since normal gunshots have inflictor == attacker
    ent:TakeDamage( damage, attacker, wep )

    if ent:IsPlayer() then
        ent:SetLastHitGroup( HITGROUP_GENERIC )
    end

    bonkInfo.IsBonked = nil
    bonkInfo.PrevVel = nil
    bonkInfo.Attacker = nil
    bonkInfo.Weapon = nil
    bonkInfo.WeaponClass = nil
    bonkedEnts[ent] = nil
end

local function detectImpact( ent, dt )
    local bonkInfo = ent.cfc9k_bonkInfo
    if not bonkInfo or not bonkInfo.IsBonked then return end

    local prevVel = bonkInfo.PrevVel

    if not prevVel then
        bonkInfo.PrevVel = ent:GetVelocity()

        return
    end

    if RealTime() > bonkInfo.ExpireTime then
        bonkInfo.IsBonked = nil
        bonkInfo.PrevVel = nil
        bonkInfo.Attacker = nil
        bonkInfo.Weapon = nil
        bonkInfo.WeaponClass = nil
        bonkedEnts[ent] = nil

        return
    end

    local curVel = ent:GetVelocity()
    local velDiff = curVel - prevVel
    local accel = velDiff:Length() / dt
    bonkInfo.PrevVel = curVel

    if accel < IMPACT_ACCELERATION_THRESHOLD then -- Not enough acceleration to be an impact
        if ent:IsOnGround() then -- Clear bonk status if ent landed on the ground smoothly or never launched up
            bonkInfo.IsBonked = nil
            bonkInfo.PrevVel = nil
            bonkInfo.Attacker = nil
            bonkInfo.Weapon = nil
            bonkInfo.WeaponClass = nil
            bonkedEnts[ent] = nil
        end

        return
    end

    handleImpact( ent, accel )
end


hook.Add( "PostEntityTakeDamage", "M9K_Stubber_Bonk_YeetVictim", function( victim, dmg, took )
    if not took then return end
    if not IsValid( victim ) then return end
    if isBuildPlayer( victim ) then return end

    local attacker = dmg:GetAttacker()
    if not IsValid( attacker ) then return end
    if not attacker:IsPlayer() then return end
    if victim:IsNPC() then return end

    if dmg:GetInflictor() ~= attacker then return end -- Prevent turrets and etc from bonking.

    local wep = attacker:GetActiveWeapon()
    if not IsValid( wep ) then return end
    if not wep.Bonk or not wep.Bonk.Enabled then return end

    bonkVictim( attacker, victim, dmg, wep )
end )

hook.Add( "Think", "M9K_Stubber_Bonk_DetectImpact", function()
    local dt = FrameTime()

    for ent in pairs( bonkedEnts ) do
        detectImpact( ent, dt )
    end
end )
