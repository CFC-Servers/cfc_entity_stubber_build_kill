AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_l85a2" )
    weapon.ReloadSpeed = 1.8
    weapon.VelocitySensitivity = 0
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.SpreadPerShot = 0.003
    weapon.Recoil = 0.7
end )
