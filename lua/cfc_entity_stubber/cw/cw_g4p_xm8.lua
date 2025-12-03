AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_xm8" )
    if not weapon then return end

    weapon.ReloadSpeed = 1.2
    weapon.VelocitySensitivity = 1.2
    weapon.SpreadPerShot = 0.002
    weapon.Recoil = 1.2
    weapon.Damage = 36
    weapon.HipSpread = 0.04
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
