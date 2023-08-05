AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_m3super90" )
    weapon.Damage = 15
    weapon.VelocitySensitivity = 0.8
    weapon.HipSpread = 0.06
    weapon.AimSpread = 0.025
    weapon.ClumpSpread = 0.04
    weapon.recoil = 4
    weapon.FireDelay = 0.8
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
