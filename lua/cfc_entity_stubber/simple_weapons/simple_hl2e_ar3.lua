AddCSLuaFile()

-- https://github.com/TankNut/simple-weapons-hl2e/blob/master/lua/weapons/simple_hl2e_ar3.lua

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "simple_hl2e_ar3" )

    weapon.Primary.Range = 1200
end )
