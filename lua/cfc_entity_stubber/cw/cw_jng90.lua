AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_jng90" )
    weapon.Damage = 120
    weapon.ACF_DamageMult = 13
    weapon.AimSpread = 0.00001
    weapon.VelocitySensitivity = 1
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.AimBreathingEnabled = false
end )
