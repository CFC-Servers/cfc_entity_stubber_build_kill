AddCSLuaFile()

-- https://github.com/Blu-x92/LunasFlightSchool/blob/master/lfs_base_content/lua/entities/lunasflightschool_combineheli/shared.lua

cfcEntityStubber.registerStub( function()
    local heli = scripted_ents.GetStored( "lunasflightschool_combineheli" )
    if not heli then return end
    heli.MaxHealth = 1000 -- originally 1600 hp
end )
