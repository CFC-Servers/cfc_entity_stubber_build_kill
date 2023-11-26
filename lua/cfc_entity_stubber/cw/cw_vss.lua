AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_vss" )
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
