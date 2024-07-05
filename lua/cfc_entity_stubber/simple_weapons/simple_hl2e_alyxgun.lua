AddCSLuaFile()

-- https://github.com/TankNut/simple-weapons-hl2e/blob/master/lua/weapons/simple_hl2e_alyxgun.lua

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "simple_hl2e_alyxgun" )

    weapon.Primary.Range = 1500

    weapon.Primary.Recoil.MinAng = Angle(0.6, -0.3, 0)
    weapon.Primary.Recoil.MaxAng = Angle(0.7, 0.3, 0)
end )
