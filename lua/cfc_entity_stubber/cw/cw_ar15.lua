AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_ar15" )
    if not weapon then return end

    weapon.DeployTime = 0
    weapon.HolsterTime = 0
    weapon.Recoil = 0.85
end )
