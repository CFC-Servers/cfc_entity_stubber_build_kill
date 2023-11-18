AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_usp40" )
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.Damage = 25
    weapon.ReloadSpeed = 1.3
    weapon.SpreadPerShot = 0.005
    weapon.SprintingEnabled = false
end )
