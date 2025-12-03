AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_m98b" )
    if not weapon then return end

    weapon.Damage = 110
    weapon.AimBreathingEnabled = false
    weapon.AimSpread = 0.00001
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.SpreadPerShot = 0.0001
    weapon.VelocitySensitivity = 0
    weapon.HipSpread = 0.05
end )
