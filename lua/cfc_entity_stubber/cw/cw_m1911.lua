AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_m1911" )
    weapon.AimSpread = 0.005
    weapon.HipSpread = 0.02
    weapon.SpreadPerShot = 0.0005
    weapon.Damage = 35
    weapon.ReloadSpeed = 1.5
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
