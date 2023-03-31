AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_mp412_rex" )
    weapon.CanRicochet = true
    weapon.CanPenetrate = false
    weapon.ReloadSpeed = 1.1
    weapon.VelocitySensitivity = 0
    weapon.SpeedDec = 0
    weapon.HipSpread = 0.001
    weapon.AimSpread = 0.0005
    weapon.SpreadPerShot = 0
    weapon.Damage = 80
    weapon.HolsterUnderwater = false
    weapon.FireDelay = 0.595
    weapon.QuickScopeSpreadIncrease = 0
    weapon.RecoilToSpread = 0
    weapon.NoRicochet = {[MAT_FLESH] = false, [MAT_ANTLION] = false, [MAT_BLOODYFLESH] = false, [MAT_DIRT] = false, [MAT_SAND] = false, [MAT_GLASS] = false, [MAT_ALIENFLESH] = false, [MAT_GRASS] = false}
end)
