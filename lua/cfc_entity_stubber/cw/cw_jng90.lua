AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_jng90" )
    weapon.Damage = 120
    weapon.ACF_DamageMult = 25
end )
