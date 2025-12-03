AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_m14" )
    if not weapon then return end

    weapon.ReloadSpeed = 1.5
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
