AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_mr96" )
    weapon.ReloadSpeed = 1.2
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.SpreadPerShot = 0.0001
end )
