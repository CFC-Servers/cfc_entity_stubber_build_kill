AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_trg42" )
    weapon.AimSpread = 0.0001
    weapon.ACF_DamageMult = 13
end )
