AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_m16a2" )
    if not weapon then return end

    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.Damage = 28
end )
