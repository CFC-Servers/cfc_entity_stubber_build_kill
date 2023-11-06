AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_mr96" )
    weapon.ReloadSpeed = 1.2
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.SpreadPerShot = 0.0001
    weapon.HipSpread = 0.02
    weapon.VelocitySensitivity = 0
end )
