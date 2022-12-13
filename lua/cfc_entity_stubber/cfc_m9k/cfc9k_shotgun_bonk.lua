AddCSLuaFile()

local IMPACT_DAMAGE_ENABLED = true
local IMPACT_DAMAGE_MULT = 10 / 30000
local IMPACT_DAMAGE_MIN = 5
local IMPACT_DAMAGE_MAX = 45
local IMPACT_ACCELERATION_THRESHOLD = 7000
local IMPACT_START_DELAY = 0.1
local IMPACT_LIFETIME = 6
local BONK_GUN_CLASS = "m9k_ithacam37"

local IsValid = IsValid


local function mathSign( x )
    if x > 0 then return 1 end
    if x < 0 then return -1 end
    return 0
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

local function bonkPlayer( attacker, victim, wep, baseForce )
    local force = baseForce * wep.Bonk.PlayerForceMult
    local zSign = mathSign( force.z )
    local zMin = wep.Bonk.PlayerForceMinZ
    local zMax = wep.Bonk.PlayerForceMaxZ

    -- z-axis ends up being the dominant aspect of what sends a player far or not when they're on the ground
    force.z = math.Clamp( math.abs( force.z ), zMin, zMax ) * zSign
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
    if IsValid( victim ) and victim:IsPlayer() then
        local force = dmg:GetDamageForce()

        -- When both players are on the ground, the force is often downwards, which makes it very weak
        if attacker:IsOnGround() and victim:IsOnGround() then
            force.z = math.abs( force.z )
        end

        -- ETD DamageForce on players only affects their death ragdoll
        if enoughToKill( victim, dmg:GetDamage() ) then
            dmg:SetDamageForce( force * wep.Bonk.PlayerForceMultRagdoll )
        else
            bonkPlayer( attacker, victim, wep, force )
        end
    else
        dmg:SetDamageForce( dmg:GetDamageForce() * wep.Bonk.PropForceMult )
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

    -- Setting the inflictor to wep ensures a proper killfeed icon, and prevents the bonk effect from re-applying since normal gunshots have inflictor == attacker
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

    weapon.Primary.RPM = 80
    weapon.Primary.ClipSize = 2
    weapon.Primary.KickUp = 10
    weapon.Primary.KickDown = 6
    weapon.Primary.KickHorizontal = 7
    weapon.Primary.NumShots = 10
    weapon.Primary.Damage = 2
    weapon.Primary.Spread = 0.12
    weapon.Primary.IronAccuracy = 0.1
    weapon.ShellTime = 0.5

    weapon.Bonk = weapon.Bonk or {}
    weapon.Bonk.PlayerForceMult = 0.5
        weapon.Bonk.PlayerForceMinZ = 230
        weapon.Bonk.PlayerForceMaxZ = 400
    weapon.Bonk.PlayerForceMultRagdoll = 300
    weapon.Bonk.PropForceMult = 15
    weapon.Bonk.SelfForce = 500


    weapon._ShootBullet = weapon.ShootBullet or cfcEntityStubber.getWeapon( "bobs_gun_base" ).ShootBullet
    weapon.ShootBullet = function( self, damage, recoil, numBullets, spread )
        local ply = self:GetOwner()
        if not IsValid( ply ) or not ply:IsPlayer() then return end

        -- Self-knockback
        if not ply:IsOnGround() then
            local dir = -ply:GetAimVector()
            ply:SetVelocity( dir * self.Bonk.SelfForce ) -- SetVelocity() when used on a player is additive
        end

        return self:_ShootBullet( damage, recoil, numBullets, spread )
    end

    hook.Add( "EntityTakeDamage", "M9K_Stubber_BonkGun_YeetVictim", function( ent, dmg )
        local attacker = dmg:GetAttacker()
        if not IsValid( attacker ) then return end
        if not attacker:IsPlayer() then return end

        if dmg:GetInflictor() ~= attacker then return end -- Prevent turrets and etc from bonking.

        local wep = attacker:GetActiveWeapon()
        if not IsValid( wep ) then return end
        if wep:GetClass() ~= BONK_GUN_CLASS then return end

        bonkVictim( attacker, ent, dmg, wep )
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






