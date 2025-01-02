AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_l115" )
    weapon.Damage = 125
    weapon.HipSpread = 0.03
    weapon.AimSpread = 0.00001
    weapon.AimBreathingEnabled = false
    weapon.PreventQuickScoping = false
    weapon.FireDelay = 1.3
    weapon.ReloadSpeed = 1.3
    weapon.VelocitySensitivity = 0.1
    weapon.zoomLevels = {
        2, 2, 2
    }
end )
