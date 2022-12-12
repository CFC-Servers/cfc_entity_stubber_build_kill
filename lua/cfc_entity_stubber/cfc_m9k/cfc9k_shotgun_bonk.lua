AddCSLuaFile()

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

local function bonkPlayer( victim, wep, baseForce )
    local force = baseForce * wep.Bonk.PlayerForceMult
    local zSign = mathSign( force.z )
    local zMin = wep.Bonk.PlayerForceMinZ
    local zMax = wep.Bonk.PlayerForceMaxZ

    -- z-axis ends up being the dominant aspect of what sends a player far or not when they're on the ground
    force.z = math.Clamp( math.abs( force.z ), zMin, zMax ) * zSign

    victim:SetVelocity( force )
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
            bonkPlayer( victim, wep, force )
        end
    else
        dmg:SetDamageForce( dmg:GetDamageForce() * wep.Bonk.PropForceMult )
    end
end


cfcEntityStubber.registerStub( function()
    local weaponClass = "m9k_ithacam37"
    local weapon = cfcEntityStubber.getWeapon( weaponClass )

    weapon.Purpose = ""
    weapon.CFC_Category = "Shotgun:Bonk"

    weapon.Primary.RPM = 80
    weapon.Primary.ClipSize = 2
    weapon.Primary.KickUp = 6
    weapon.Primary.KickDown = 4
    weapon.Primary.KickHorizontal = 5
    weapon.Primary.NumShots = 10
    weapon.Primary.Damage = 2
    weapon.Primary.Spread = 0.05
    weapon.Primary.IronAccuracy = 0.035
    weapon.ShellTime = 0.4

    weapon.Bonk = weapon.Bonk or {}
    weapon.Bonk.PlayerForceMult = 0.9
        weapon.Bonk.PlayerForceMinZ = 210
        weapon.Bonk.PlayerForceMaxZ = 400
    weapon.Bonk.PlayerForceMultRagdoll = 300
    weapon.Bonk.PropForceMult = 7
    weapon.Bonk.SelfForce = 500


    local IsValid = IsValid

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

        local wep = attacker:GetActiveWeapon()
        if not IsValid( wep ) then return end

        if wep:GetClass() ~= weaponClass then return end

        bonkVictim( attacker, ent, dmg, wep )
    end )
end )






