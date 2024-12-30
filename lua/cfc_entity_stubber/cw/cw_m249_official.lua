AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_m249_official" )
    weapon.HipSpread = 0.02
    weapon.VelocitySensitivity = 2.0
    weapon.FireDelay = 0.1
    weapon.AimSpread = 0.005
    weapon.SpreadPerShot = 0.007
    weapon.SpreadCooldown = 0.05
    weapon.MaxSpreadInc = 0.02
    weapon.Recoil = 1.7
    weapon.Damage = 37
end )
