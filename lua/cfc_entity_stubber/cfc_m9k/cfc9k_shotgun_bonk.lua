AddCSLuaFile()

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
    weapon.Primary.Spread = 0.1
    weapon.Primary.IronAccuracy = 0.07
    weapon.ShellTime = 0.4

    weapon.Bonk = weapon.Bonk or {}
    weapon.Bonk.VictimForceMult = 300
    weapon.Bonk.PropForceMult = 7
    weapon.Bonk.SelfForce = 500


    local IsValid = IsValid

    weapon._ShootBullet = weapon.ShootBullet
    weapon.ShootBullet = function( self, damage, recoil, numBullets, spread )
        local ply = self:GetOwner()
        if not IsValid( ply ) or not ply:IsPlayer() then return end

        if ply:IsOnGround() then return end -- Only apply self-knockback if in the air

        local dir = -ply:GetAimVector()
        ply:SetVelocity( dir * self.Bonk.SelfForce ) -- SetVelocity() when used on a player is additive

        return weapon._ShootBullet( self, damage, recoil, numBullets, spread )
    end

    hook.Add( "EntityTakeDamage", "M9K_Stubber_BonkGun_YeetVictim", function( ent, dmg )
        local attacker = dmg:GetAttacker()
        if not IsValid( attacker ) then return end
        if not attacker:IsPlayer() then return end

        local wep = attacker:GetActiveWeapon()
        if not IsValid( wep ) then return end

        if wep:GetClass() ~= weaponClass then return end

        if IsValid( ent ) and ent:IsPlayer() then
            dmg:SetDamageForce( dmg:GetDamageForce() * wep.Bonk.VictimForceMult )
        else
            dmg:SetDamageForce( dmg:GetDamageForce() * wep.Bonk.PropForceMult )
        end
    end )
end )






