AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_l115" )
    weapon.ACF_DamageMult = 15
    weapon.damage = 150
end )
