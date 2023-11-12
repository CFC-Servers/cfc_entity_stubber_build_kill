AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g18" )
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.ReloadSpeed = 1.4
    weapon.VelocitySensitivity = 0
end )
