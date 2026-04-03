hook.Add( "PreRegisterSWEP", "CFC_EntityStubber_DisableSimpleWeapons", function( swep, class )
    if swep and swep.Category == "Simple Weapons: Half-Life 2" then
        swep.AdminOnly = true
        swep.Spawnable = false
    end
end )
