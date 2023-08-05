AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_p99" )
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
