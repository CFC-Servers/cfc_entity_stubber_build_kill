AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_l85a2" )
    weapon.ReloadSpeed = 1.8
    weapon.VelocitySensitivity = 0
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.SpreadPerShot = 0.0015
    weapon.Recoil = 0.8
    weapon.damage = 33
end )
