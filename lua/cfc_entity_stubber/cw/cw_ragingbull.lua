AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_ragingbull" )
    weapon.HipSpread = 0.005
    weapon.AimSpread = 0.005
    weapon.MaxSpreadInc = 0.01
    weapon.VelocitySensitivity = 0
    weapon.SpreadPerShot = 0.01
    weapon.Damage = 70
    weapon.ACF_DamageMult = 6
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
