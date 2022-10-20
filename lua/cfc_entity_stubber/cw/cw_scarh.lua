AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_scarh" )
    weapon.AimSpread = 0.0010
    weapon.SpreadPerShot = 0.005
    weapon.ReloadSpeed = 1.3
end )
