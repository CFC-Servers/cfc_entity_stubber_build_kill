AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "ins2_atow_rpg7" )
    if not weapon then return end

    weapon.ReloadSpeed = 0.7
end )
