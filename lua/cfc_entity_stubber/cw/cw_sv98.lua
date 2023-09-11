AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_sv98" )
    weapon.SpreadCooldown = 0.05
    weapon.HipSpread = 0.05
    weapon.AimBreathingEnabled = false
    weapon.AimSpread = 0.00001
    weapon.Damage = 110
    weapon.ACF_DamageMult = 10
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
