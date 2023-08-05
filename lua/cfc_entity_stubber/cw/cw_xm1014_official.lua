AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_xm1014_official" )
    weapon.VelocitySensitivity = 1.5
    weapon.FireDelay = 0.4
    weapon.Damage = 10
    weapon.HipSpread = 0.045
    weapon.AimSpread = 0.035
    weapon.SpreadPerShot = 0.02
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
