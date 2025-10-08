AddCSLuaFile()

-- https://github.com/CFC-Servers/m9k_monorepo/blob/main/lua/weapons/m9k_remington7615p.lua
cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "m9k_remington7615p" )

    -- Sub-par sniper with tons of damage force. Mostly affects props and ragdolls.
    -- (The old stats suck, why not make it more interesting?)

    weapon.Instructions = "Funny ragdoll generator."

    weapon.Primary.Damage = 45
    weapon.Primary.KnockbackMult = 15

    local base = baseclass.Get( weapon.Base )
    local oldBulletCallback = base.BulletCallback

    function weapon:BulletCallback( iteration, attacker, bulletTrace, dmginfo, direction )
        dmginfo:SetDamageForce( dmginfo:GetDamageForce() * self.Primary.KnockbackMult )

        return oldBulletCallback( self, iteration, attacker, bulletTrace, dmginfo, direction )
    end
end )
