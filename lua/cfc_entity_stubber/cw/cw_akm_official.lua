AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_akm_official" )
    weapon.VelocitySensitivity = 0
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.HipSpread = 0.02
    weapon.SpreadPerShot = 0.008
end )
