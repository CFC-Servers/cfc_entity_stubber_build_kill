AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_mr96" )
    weapon.ReloadSpeed = 1.2
    weapon.ACF_DamageMult = 20
end )
