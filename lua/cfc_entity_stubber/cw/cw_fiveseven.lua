AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_fiveseven" )
    if not weapon then return end

    weapon.Damage = 30
    weapon.HipSpread = 0.02
    weapon.MaxSpreadInc = 0.02
    weapon.ReloadSpeed = 1.6
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.VelocitySensitivity = 0.5
    weapon.SprintingEnabled = false
end )
