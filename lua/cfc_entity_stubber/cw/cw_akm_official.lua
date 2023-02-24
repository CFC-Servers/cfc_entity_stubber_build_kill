AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_akm_official" )
    weapon.ACF_DamageMult = 10
end )
