AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_ragingbull" )
    if not weapon then return end

    weapon.HipSpread = 0.005
    weapon.AimSpread = 0.005
    weapon.MaxSpreadInc = 0.01
    weapon.VelocitySensitivity = 0
    weapon.ReloadSpeed = 1.15
    weapon.SpreadPerShot = 0.0001
    weapon.Damage = 70
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.SprintingEnabled = false
end )
