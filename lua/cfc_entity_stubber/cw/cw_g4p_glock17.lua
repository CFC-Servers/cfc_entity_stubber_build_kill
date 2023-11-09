AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_glock17" )
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.ReloadSpeed = 1.4
    weapon.Damage = 25
    weapon.VelocitySensitivity = 0
    weapon.SpreadPerShot = 0.005
end )
