AddCSLuaFile()

-- https://github.com/TankNut/simple-weapons-hl2e/blob/master/lua/weapons/simple_hl2e_oicw.lua

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "simple_hl2e_oicw" )

    weapon.Primary.Damage = 26
    weapon.Primary.Range = 1400

    weapon.Primary.Recoil.MinAng = Angle(0.8, -0.4, 0)
    weapon.Primary.Recoil.MaxAng = Angle(1, 0.4, 0)
end )
