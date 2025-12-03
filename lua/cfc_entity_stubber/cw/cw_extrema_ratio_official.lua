AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_extrema_ratio_official" )
    if not weapon then return end

    weapon.HolsterUnderwater = false
end )
