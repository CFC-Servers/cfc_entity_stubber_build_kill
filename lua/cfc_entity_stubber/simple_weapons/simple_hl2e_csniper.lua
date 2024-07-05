AddCSLuaFile()

-- https://github.com/TankNut/simple-weapons-hl2e/blob/master/lua/weapons/simple_hl2e_csniper.lua

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "simple_hl2e_csniper" )
    local base = baseclass.Get( "simple_base_scoped" )

    weapon.Primary.Damage = 160

    weapon.Primary.Range = 8000
    weapon.Primary.Accuracy = 8

    weapon.Primary.RangeModifier = 0.96

    -- Don't allow the weapon to fire while unscoped
    weapon.CanPrimaryFire = function( self )
        if not base.CanPrimaryFire( self ) then
            return false
        end

        if self:GetScopeIndex() == 0 then
            self:EmitSound( "items/medshotno1.wav", 75, 100, 0.7, CHAN_STATIC )

            self:SetNextFire( CurTime() + 0.2 )
            self:ForceStopFire()

            return false
        end

        return true
    end
end )
