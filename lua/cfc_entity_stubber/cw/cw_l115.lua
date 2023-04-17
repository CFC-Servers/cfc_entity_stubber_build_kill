AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_l115" )
    weapon.damage = 150
    weapon.ACF_DamageMult = 10
end )
