AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_masada_acr" )
    if not weapon then return end

    weapon.VelocitySensitivity = 0
    weapon.Damage = 27
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.SpreadPerShot = 0.002
end )
