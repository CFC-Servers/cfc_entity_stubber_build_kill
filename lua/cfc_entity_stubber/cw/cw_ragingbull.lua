AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_ragingbull" )
    weapon.HipSpread = 0.01
    weapon.MaxSpreadInc = 0.03
end )
