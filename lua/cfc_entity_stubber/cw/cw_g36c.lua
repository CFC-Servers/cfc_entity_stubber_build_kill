AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g36c" )
    if not weapon then return end

    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.VelocitySensitivity = 0
    weapon.ReloadSpeed = 1.4
    weapon.AimSpread = 0.001
    weapon.Damage = 33
    weapon.HipSpread = 0.03
end )
