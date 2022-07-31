AddCSLuaFile()
cfcEntityStubber.registerStub( function()
    -- https://github.com/Facepunch/garrysmod-issues/issues/5290 this issue makes some guns such as the cw rpg unusable on base branches
    -- So we just disable the spread sensitivity scaling
    local weapon = cfcEntityStubber.getWeapon( "cw_base" )
    weapon.scaleSensitivityToSpread = false
end )
