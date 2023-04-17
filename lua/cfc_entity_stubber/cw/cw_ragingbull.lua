AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_ragingbull" )
    weapon.HipSpread = 0.009
    weapon.AimSpread = 0.009
    weapon.MaxSpreadInc = 0.03
    weapon.VelocitySensitivity = 0
    weapon.Damage = 70
    weapon.ACF_DamageMult = 6
end )
