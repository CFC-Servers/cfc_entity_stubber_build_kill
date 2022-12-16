AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_l115" )
    weapon.ACF_DamageMult = 10
    weapon.damage = 150
end )
