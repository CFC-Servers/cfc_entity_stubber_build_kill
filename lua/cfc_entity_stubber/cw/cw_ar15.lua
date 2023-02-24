AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_ar15" )
    weapon.ACF_DamageMult = 10
end )
