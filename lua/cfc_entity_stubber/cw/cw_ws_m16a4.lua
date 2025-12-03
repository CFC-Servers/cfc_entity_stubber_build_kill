AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_ws_m16a4" )
    if not weapon then return end

    weapon.Damage = 25
end )
