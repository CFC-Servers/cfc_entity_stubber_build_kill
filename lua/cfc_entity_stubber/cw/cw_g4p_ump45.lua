AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_ump45" )
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.VelocitySensitivity = 0
    weapon.HipSpread = 0.03
    weapon.SpreadPerShot = 0.006
    weapon.Damage = 30
    weapon.MaxSpreadInc = 0.03
end )
