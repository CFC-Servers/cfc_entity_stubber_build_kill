AddCSLuaFile()

-- https://github.com/TankNut/simple-weapons-hl2e/blob/master/lua/weapons/simple_hl2e_autogun.lua

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "simple_hl2e_autogun" )

    weapon.Primary.Damage = 60
end )
