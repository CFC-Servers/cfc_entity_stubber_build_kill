AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_ar15" )
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.Recoil = 0.85
end )
