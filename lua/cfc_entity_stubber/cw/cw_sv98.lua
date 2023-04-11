AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_sv98" )
    weapon.SpreadCooldown = 0.05
    weapon.HipSpread = 0.05
    weapon.damage = 125
    weapon.ACF_DamageMult = 10
end )
