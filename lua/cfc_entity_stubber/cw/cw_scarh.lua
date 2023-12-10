AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_scarh" )
    weapon.AimSpread = 0.0010
    weapon.SpreadPerShot = 0.004
    weapon.ReloadSpeed = 1.3
    weapon.VelocitySensitivity = 0
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.HipSpread = 0.035
    weapon.Recoil = 1.3
end )
