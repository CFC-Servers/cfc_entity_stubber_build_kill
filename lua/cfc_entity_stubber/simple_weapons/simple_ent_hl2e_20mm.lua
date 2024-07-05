AddCSLuaFile()

-- https://github.com/TankNut/simple-weapons-hl2e/blob/master/lua/entities/simple_ent_hl2e_20mm.lua

cfcEntityStubber.registerStub( function()
    local entity = cfcEntityStubber.getWeapon( "simple_ent_hl2e_20mm" )

    entity.Damage = 60
end )
