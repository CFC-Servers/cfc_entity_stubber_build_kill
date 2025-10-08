AddCSLuaFile()

-- https://github.com/CFC-Servers/m9k_monorepo/blob/main/lua/weapons/m9k_model627.lua
cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "m9k_model627" )

    -- Damage starts off low and increases as the clip empties.

    weapon.Primary.DamageByClip = { 10, 10, 15, 25, 30, 60 }

    function weapon:ShootBulletInformation()
        local currentCone

        if self:GetIronsightsActive() == true and self:GetOwner():KeyDown( IN_ATTACK2 ) then
            currentCone = self.Primary.SpreadIronSights
        else
            currentCone = self.Primary.SpreadHip
        end

        -- Note that Clip1 gets reduced only after this function is called.
        local damageByClip = self.Primary.DamageByClip
        local bulletInd = math.max( self:GetMaxClip1() - self:Clip1(), 0 ) % #damageByClip + 1

        self:ShootBullet( damageByClip[bulletInd], self.Primary.NumShots, currentCone )
    end
end )
