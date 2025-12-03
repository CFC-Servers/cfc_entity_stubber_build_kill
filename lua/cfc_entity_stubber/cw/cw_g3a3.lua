AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g3a3" )
    if not weapon then return end

    weapon.FireDelay = 0.09
    weapon.ReloadSpeed = 1.40
    weapon.DeployTime = 0
    weapon.HolsterTime = 0
end )
