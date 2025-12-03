AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_m16a4" )
    if not weapon then return end

    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
