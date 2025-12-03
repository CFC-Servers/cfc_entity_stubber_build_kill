AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_makarov" )
    if not weapon then return end

    weapon.Damage = 30
    weapon.ReloadSpeed = 1.3
    weapon.HipSpread = 0.03
    weapon.AimSpread = 0.005
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.SprintingEnabled = false
end )
