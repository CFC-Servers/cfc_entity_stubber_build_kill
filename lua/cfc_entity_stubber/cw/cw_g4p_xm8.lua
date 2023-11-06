AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_xm8" )
    weapon.ReloadSpeed = 1.2
    weapon.VelocitySensitivity = 1.4
    weapon.SpreadPerShot = 0.004
    weapon.Recoil = 1.3
end )
