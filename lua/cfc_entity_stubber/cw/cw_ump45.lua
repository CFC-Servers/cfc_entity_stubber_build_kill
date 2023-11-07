AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_ump45" )
    weapon.ReloadSpeed = 1.6
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.VelocitySensitivity = 0.5
end )
