AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_mp7_official" )
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
