AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_awm" )
    weapon.Recoil = 15
    weapon.Damage = 150
    weapon.ACF_DamageMult = 10
    weapon.AimBreathingEnabled = false
    weapon.AimSpread = 0.00001
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
