AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_deagle" )
    if not weapon then return end

    weapon.FireDelay = 0.595
    weapon.ReloadSpeed = 1.25
    weapon.HipSpread = 0.005
    weapon.AimSpread = 0.001
    weapon.VelocitySensitivity = 0
    weapon.ReloadSpeed = 1.45
    weapon.Damage = 75
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.SpreadPerShot = 0.0001
    weapon.SprintingEnabled = false
end )
