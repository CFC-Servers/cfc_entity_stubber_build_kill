AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_l115" )
    weapon.ACF_DamageMult = 20
    weapon.damage = 150
end )
