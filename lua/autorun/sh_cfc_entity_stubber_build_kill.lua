if SERVER then
    AddCSLuaFile()
end

hook.Add( "EasyRocketJumps_ScaleDamage", "DisableNitroReduction", function( _ent, dmginfo )
    if dmginfo:GetInflictor():GetClass() == "m9k_nitro_vapor" then
        return 1
    end
end )

hook.Add( "PreRegisterSWEP", "CFC_EntityStubber_CustomPatches", function( swep )
    if swep and swep.Category == "Simple Weapons: Half-Life 2" then
        swep.AdminOnly = true
        swep.Spawnable = false
    end

    if swep and swep.Category == "M9K Pistols" then
        swep.CanShootWhileRunning = true
    end
end )
