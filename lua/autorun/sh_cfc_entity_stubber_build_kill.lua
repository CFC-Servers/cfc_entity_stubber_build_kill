if SERVER then
    AddCSLuaFile()
    AddCSLuaFile( "cfc_entity_stubber/build_kill_hooks.lua" )
end

include( "cfc_entity_stubber/build_kill_hooks.lua" )
