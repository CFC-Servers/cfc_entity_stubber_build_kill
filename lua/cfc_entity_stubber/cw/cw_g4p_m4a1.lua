AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_m4a1" )
    if not weapon then return end

    weapon.VelocitySensitivity = 1
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.ReloadSpeed = 1.2
    weapon.SpreadPerShot = 0.002
end )
