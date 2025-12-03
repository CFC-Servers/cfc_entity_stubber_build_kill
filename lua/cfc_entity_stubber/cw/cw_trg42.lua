AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_trg42" )
    if not weapon then return end

    weapon.AimSpread = 0.0001
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.VelocitySensitivity = 1
    weapon.AimBreathingEnabled = false
end )
