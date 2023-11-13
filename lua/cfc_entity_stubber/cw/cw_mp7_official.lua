AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_mp7_official" )
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.ReloadSpeed = 1.7
    weapon.VelocitySensitivity = 0.5
    weapon.AimSpread = 0.04
    weapon.HipSpread = 0.05
    weapon.DrawCrosshair = true
    weapon.ViewModelMovementScale = 0
    weapon.ViewbobEnabled = false
    weapon.AimSwayIntensity = 0
    weapon.LuaViewmodelRecoil = false
    weapon.LuaViewmodelRecoilOverride = false
end )
