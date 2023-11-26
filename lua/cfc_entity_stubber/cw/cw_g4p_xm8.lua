AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_xm8" )
    weapon.ReloadSpeed = 1.2
    weapon.VelocitySensitivity = 1.4
    weapon.SpreadPerShot = 0.004
    weapon.Recoil = 1.2
    weapon.Damage = 34
    weapon.HipSpread = 0.04
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
