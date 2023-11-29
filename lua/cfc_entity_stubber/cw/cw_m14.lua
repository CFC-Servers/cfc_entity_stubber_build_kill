AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_m14" )
    weapon.ReloadSpeed = 1.5
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
