AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_shorty" )
    weapon.VelocitySensitivity = 0.5
    weapon.Recoil = 6
    weapon.damage = 12
    weapon.HipSpread = 0.06
    weapon.AimSpread = 0.03
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
