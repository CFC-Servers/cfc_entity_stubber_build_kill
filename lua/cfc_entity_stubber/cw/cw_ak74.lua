AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_ak74" )
    if not weapon then return end

    weapon.VelocitySensitivity = 0
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.ReloadSpeed = 1.2
    weapon.HipSpread = 0.03
    weapon.SpreadPerShot = 0.003
    weapon.Damage = 33
end )
