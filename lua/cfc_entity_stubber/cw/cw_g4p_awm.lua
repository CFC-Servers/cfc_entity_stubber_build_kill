AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_awm" )
    weapon.Recoil = 15
    weapon.Damage = 150
end )
