AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_an94" )
    weapon.ReloadSpeed = 1.4
    weapon.VelocitySensitivity = 0
    weapon.Damage = 35
    weapon.HipSpread = 0.03
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
