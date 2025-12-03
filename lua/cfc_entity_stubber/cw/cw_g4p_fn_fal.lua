AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_fn_fal" )
    if not weapon then return end

    weapon.ReloadSpeed = 1.3
    weapon.VelocitySensitivity = 1
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
