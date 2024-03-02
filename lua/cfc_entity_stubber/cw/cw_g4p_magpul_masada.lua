AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_magpul_masada" )
    weapon.ReloadSpeed = 1.4
    weapon.HipSpread = 0.04
    weapon.CanRicochet = true
    weapon.CanPenetrate = false
    weapon.SpreadPerShot = 0.004
    weapon.NoRicochet = {[MAT_FLESH] = true, [MAT_ANTLION] = false, [MAT_BLOODYFLESH] = false, [MAT_DIRT] = false, [MAT_SAND] = false, [MAT_GLASS] = false, [MAT_ALIENFLESH] = false, [MAT_GRASS] = false}
end )
