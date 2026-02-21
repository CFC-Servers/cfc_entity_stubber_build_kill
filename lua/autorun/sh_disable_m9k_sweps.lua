do
    local badClasses = {
        m9k_davy_crockett = true,
        m9k_ex41 = true,
        m9k_ied_detonator = true,
        m9k_m79gl = true,
        m9k_m202 = true,
        m9k_matador = true,
        m9k_milkormgl = true,
        m9k_nerve_gas = true,
        m9k_orbital_strike = true,
        m9k_rpg7 = true,
        m9k_minigun = true,
    }

    hook.Add( "PreRegisterSWEP", "CFC_EntityStubber_DisableM9kSWEPS", function( swep, class )
        if badClasses[class] then
            swep.AdminOnly = true
            swep.Spawnable = false
        end
    end )
end

-- Disable bad sents
do
    local badClasses = {
        -- Ammo
        m9k_ammo_40mm = true,
        m9k_ammo_c4 = true,
        m9k_ammo_frags = true,
        m9k_ammo_ieds = true,
        m9k_ammo_nervegas = true,
        m9k_ammo_nuke = true,
        m9k_ammo_proxmines = true,
        m9k_ammo_rockets = true,
        m9k_ammo_40mm_single = true,
        m9k_ammo_stickynades = true,
        m9k_ammo_orbitalstrike = true,
    }

    hook.Add( "PreRegisterSENT", "CFC_EntityStubber_DisableM9kSENTs", function( _, class )
        if badClasses[class] then return false end
    end )
end
