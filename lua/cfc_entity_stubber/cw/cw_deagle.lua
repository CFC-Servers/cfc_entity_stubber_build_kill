AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_deagle" )
    weapon.FireDelay = 0.595
    weapon.ReloadSpeed = 1.25
    weapon.HipSpread = 0.01
    weapon.AimSpread = 0.005
    weapon.VelocitySensitivity = 0.7
    weapon.Damage = 80
    weapon.ACF_DamageMult = 7
end )
