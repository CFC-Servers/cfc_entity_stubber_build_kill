AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_mp5" )
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
