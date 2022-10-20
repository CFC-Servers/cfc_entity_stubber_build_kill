AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_makarov" )
    weapon.Damage = 30
    weapon.DeployTime = 0.01
end )
