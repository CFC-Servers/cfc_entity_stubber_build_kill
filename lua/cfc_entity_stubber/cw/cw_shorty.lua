AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_shorty" )
    weapon.VelocitySensitivity = 0.5
    weapon.Recoil = 6
    weapon.damage = 10
end )
