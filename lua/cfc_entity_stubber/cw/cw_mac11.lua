AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_mac11" )
    if not weapon then return end

    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.VelocitySensitivity = 0
end )
