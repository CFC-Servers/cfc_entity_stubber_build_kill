AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_mr96" )
    if not weapon then return end

    weapon.ReloadSpeed = 1.2
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.SpreadPerShot = 0
    weapon.HipSpread = 0.01
    weapon.AimSpread = 0.001
    weapon.VelocitySensitivity = 0
    weapon.RecoilToSpread = 0
    weapon.SprintingEnabled = false
    weapon.Recoil = 2.2
end )
