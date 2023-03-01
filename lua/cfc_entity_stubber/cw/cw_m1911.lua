AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_m1911" )
    weapon.AimSpread = 0.005
    weapon.SpreadPerShot = 0.0005
    weapon.Damage = 35
    weapon.ReloadSpeed = 1.5
end )
