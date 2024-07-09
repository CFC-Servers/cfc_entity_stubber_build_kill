AddCSLuaFile()

-- https://github.com/TankNut/simple-weapons-hl2e/blob/master/lua/weapons/simple_hl2e_ar3_sniper.lua

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "simple_hl2e_ar3_sniper" )

    weapon.Primary.Range = 4000
    weapon.Primary.Accuracy = 8

    weapon.Primary.UnscopedRange = 800
end )
