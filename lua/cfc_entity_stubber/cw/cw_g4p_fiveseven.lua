AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_fiveseven" )
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.VelocitySensitivity = 0
    weapon.Damage = 27
    weapon.SpreadPerShot = 0.005
    weapon.ReloadSpeed = 1.2
    weapon.MaxSpreadInc = 0.04
    weapon.SprintingEnabled = false
end )
