AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local launcher = weapons.GetStored( "weapon_lfsmissilelauncher" )
    launcher.Spawnable = false
end )
