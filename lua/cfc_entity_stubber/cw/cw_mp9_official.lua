AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_mp9_official" )
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.VelocitySensitivity = 0
end )
