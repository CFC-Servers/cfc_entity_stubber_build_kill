AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_fiveseven" )
    weapon.Damage = 30
    weapon.HipSpread = 0.02
    weapon.MaxSpreadInc = 0.02
    weapon.ReloadSpeed = 1.7
    weapon.ACF_DamageMult = 10
end )
