AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_boberg" )
    weapon.Damage = 50
    weapon.AimSpread = 0.005
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
