AddCSLuaFile()

local IMPACT_DAMAGE_ENABLED = true
local IMPACT_DAMAGE_MULT = 10 / 20000
local IMPACT_DAMAGE_MIN = 5
local IMPACT_DAMAGE_MAX = 45
local IMPACT_ACCELERATION_THRESHOLD = 7000
local IMPACT_START_DELAY = 0.07
local IMPACT_LIFETIME = 6
local AIR_SHOTS_REFUND_AMMO = false -- Shooting a mid-air victim while they've been bonked refunds a single shot of ammo
local BONK_GUN_CLASS = "m9k_ithacam37"

local IsValid = IsValid


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
    local armor = ply:Armor()

    -- Note: this currently doesn't check for godmode
    if dmgAmount >= health + armor then
        return true
    end

    return false
end

-- Refunds a single shot of ammo if the victim is in the air due to being bonked
local function refundAirShot( attacker, victim, wep )
    if not AIR_SHOTS_REFUND_AMMO then return end
    if not attacker.cfc9k_bonkCanRefund then return end

    attacker.cfc9k_bonkCanRefund = false -- Only refund once per shot, so shooting two players doesn't give extra ammo

    if not IsValid( wep ) then return end
    if victim:IsOnGround() then return end

    local bonkInfo = victim.cfc9k_bonkInfo or {}
    if not bonkInfo.IsBonked then return end

    local clipAmmo = wep:Clip1()
    local clipMax = wep.Primary.ClipSize
    if clipAmmo >= clipMax then return end

    wep:SetClip1( clipAmmo + 1 )
end

local function counteractOpposingVelocity( ply, forceDir )
    local plyVel = ply:GetVelocity()
    local dot = plyVel:Dot( forceDir )

    if dot >= 0 then return Vector( 0, 0, 0 ) end

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

    local counterForce = counteractOpposingVelocity( victim, dmgForce ) * wep.Bonk.PlayerForceCounteractMult
    local forceStrength = wep.Bonk.PlayerForce * damageMult
    local force = dmgForce * forceStrength + counterForce

    if fromGround then
        force.z = math.max( force.z, wep.Bonk.PlayerForceGroundZMin )
    end

    return force
end

local function bonkPlayer( attacker, victim, force )
    if not force then return end

    victim:SetVelocity( force )

    if not IMPACT_DAMAGE_ENABLED then return end

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
    end )
end

local function bonkVictim( attacker, victim, dmg, wep )
    local dmgForce = dmg:GetDamageForce()

    if IsValid( victim ) and victim:IsPlayer() then
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

            bonkPlayer( attacker, victim, force )
        end
    else
        dmg:SetDamageForce( dmgForce * wep.Bonk.PropForceMult )
    end
end

local function handleImpact( ply, accel )
    local bonkInfo = ply.cfc9k_bonkInfo

    local damage = math.Clamp( accel * IMPACT_DAMAGE_MULT, IMPACT_DAMAGE_MIN, IMPACT_DAMAGE_MAX )
    local attacker = IsValid( bonkInfo.Attacker ) and bonkInfo.Attacker or game.GetWorld()
    local wep = attacker:GetWeapon( BONK_GUN_CLASS )

    if not IsValid( wep ) then
        wep = attacker
    end

    if not ply:IsOnGround() then
        ply:EmitSound( "physics/body/body_medium_impact_hard" .. math.random( 1, 6 ) .. ".wav", 85 )
    end

    -- Setting the inflictor to wep ensures a proper killfeed icon, and prevents the bonk effect from re-applying since normal gunshots have inflictor == attacker
    ply:SetLastHitGroup( HITGROUP_GENERIC )
    ply:TakeDamage( damage, attacker, wep )

    bonkInfo.IsBonked = nil
    bonkInfo.PrevVel = nil
    bonkInfo.Attacker = nil
end

local function detectImpact( ply, dt )
    local bonkInfo = ply.cfc9k_bonkInfo
    if not bonkInfo or not bonkInfo.IsBonked then return end

    local prevVel = bonkInfo.PrevVel

    if not prevVel then
        bonkInfo.PrevVel = ply:GetVelocity()

        return
    end

    if RealTime() > bonkInfo.ExpireTime then
        bonkInfo.IsBonked = nil
        bonkInfo.PrevVel = nil
        bonkInfo.Attacker = nil

        return
    end

    local curVel = ply:GetVelocity()
    local velDiff = curVel - prevVel
    local accel = velDiff:Length() / dt
    bonkInfo.PrevVel = curVel

    if accel < IMPACT_ACCELERATION_THRESHOLD then -- Not enough acceleration to be an impact
        if ply:IsOnGround() then -- Clear bonk status if ply landed on the ground smoothly or never launched up
            bonkInfo.IsBonked = nil
            bonkInfo.PrevVel = nil
            bonkInfo.Attacker = nil
        end

        return
    end

    handleImpact( ply, accel )
end


cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( BONK_GUN_CLASS )

    weapon.Purpose = ""
    weapon.CFC_Category = "Shotgun:Bonk"

    weapon.Primary.RPM = 85
    weapon.Primary.ClipSize = 2
    weapon.Primary.KickUp = 14
    weapon.Primary.KickDown = 6
    weapon.Primary.KickHorizontal = 7
    weapon.Primary.NumShots = 10
    weapon.Primary.Damage = 2
    weapon.Primary.Spread = 0.13
    weapon.Primary.IronAccuracy = 0.1
    weapon.ShellTime = 0.7

    weapon.Bonk = weapon.Bonk or {}
    weapon.Bonk.PlayerForce = 820 / 0.7 -- Soft-maximum launch strength for when all bullets hit, assuming no special hitgroups (e.g. only hit the chest)
        weapon.Bonk.PlayerForceMultMax = 0.7 -- Damage mult (normal is 1) cannot exceed this value (otherwise could have massive launches from M9K damage spread, headshots, etc.)
        weapon.Bonk.PlayerForceComboMult = 1.7 -- Multiplies against force strength if the victim is currently in a bonk state
        weapon.Bonk.PlayerForceGroundZMult = 0.9 -- Makes ground launches be more vertical, proportionally
        weapon.Bonk.PlayerForceGroundZAdd = 0.25 -- Makes ground launches be more vertical, additively
        weapon.Bonk.PlayerForceGroundZMin = 250 -- Minimim z-component of launch force when on the ground. Gmod keeps players grounded unless the the z-vel is ~248.13 or above
        weapon.Bonk.PlayerForceAirMult = 1.15 -- Multiplies against force strength if the victim is in the air when hit
        weapon.Bonk.PlayerForceAirZMult = 1 -- Makes air launches be more vertical, proportionally
        weapon.Bonk.PlayerForceAirZAdd = 0.1 -- Makes air launches be more vertical, additively
        weapon.Bonk.PlayerForceCounteractMult = 0.8 -- How strongly (0-1) the victim's velocity will be counteracted by the launch, if they were moving opposite to it
        weapon.Bonk.PlayerForceIgnoreThreshold = 0.2 -- If the damage multiplier is below this, the player won't be launched
    weapon.Bonk.PlayerForceMultRagdoll = 300
    weapon.Bonk.PropForceMult = 15
    weapon.Bonk.SelfForce = Vector( 300, 300, 420 ) -- Self-knockback when shooting while in the air
    weapon.Bonk.SelfDamage = 6 -- Damage dealt to self when shooting while in the air


    if CLIENT then return end

    weapon._ShootBullet = weapon.ShootBullet or cfcEntityStubber.getWeapon( "bobs_gun_base" ).ShootBullet
    weapon.ShootBullet = function( self, damage, recoil, numBullets, spread )
        local ply = self:GetOwner()
        if not IsValid( ply ) or not ply:IsPlayer() then return end

        -- Self-knockback
        if not ply:IsOnGround() then
            local dir = -ply:GetAimVector()
            ply:SetVelocity( dir * self.Bonk.SelfForce ) -- SetVelocity() when used on a player is additive

            local selfDamage = self.Bonk.SelfDamage
            if selfDamage > 0 then
                ply:TakeDamage( selfDamage, ply, self )
                ply:EmitSound( "physics/body/body_medium_impact_soft" .. math.random( 1, 7 ) .. ".wav", 85 )
            end
        end

        if AIR_SHOTS_REFUND_AMMO then
            ply.cfc9k_bonkCanRefund = true
        end

        return self:_ShootBullet( damage, recoil, numBullets, spread )
    end

    hook.Add( "EntityTakeDamage", "M9K_Stubber_BonkGun_YeetVictim", function( victim, dmg )
        if not IsValid( victim ) then return end
        if isBuildPlayer( victim ) then return end

        local attacker = dmg:GetAttacker()
        if not IsValid( attacker ) then return end
        if not attacker:IsPlayer() then return end

        if dmg:GetInflictor() ~= attacker then return end -- Prevent turrets and etc from bonking.

        local wep = attacker:GetActiveWeapon()
        if not IsValid( wep ) then return end
        if wep:GetClass() ~= BONK_GUN_CLASS then return end

        bonkVictim( attacker, victim, dmg, wep )
    end )


    if not IMPACT_DAMAGE_ENABLED then return end

    hook.Add( "Think", "M9K_Stubber_BonkGun_DetectImpact", function()
        local dt = FrameTime()
        local plys = player.GetAll()

        for i = 1, #plys do
            local ply = plys[i]

            detectImpact( ply, dt )
        end
    end )
end )






