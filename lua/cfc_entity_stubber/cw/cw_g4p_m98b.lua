AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_m98b" )
    weapon.Damage = 110
    weapon.ACF_DamageMult = 13
    weapon.AimBreathingEnabled = false
    weapon.AimSpread = 0.00001
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
