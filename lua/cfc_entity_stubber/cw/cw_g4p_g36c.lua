AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_g36c" )
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.VelocitySensitivity = 0
    weapon.Damage = 30
    weapon.SpreadPerShot = 0.005
end )
