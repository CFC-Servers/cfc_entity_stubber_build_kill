AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g3a3" )
    weapon.FireDelay = 0.09
    weapon.ReloadSpeed = 1.40
    weapon.ACF_DamageMult = 10
end )
