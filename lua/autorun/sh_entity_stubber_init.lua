-- Disable bad sweps
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
    }

    hook.Add( "PreRegisterSWEP", "CFC_EntityStubber_DisableM9kSWEPS", function( _, class )
        if badClasses[class] then return false end
    end )

    hook.Add( "PlayerSpawnSWEP", "CFC_EntityStubber_DisableM9kSWEPS", function( _, class )
        if badClasses[class] then return false end
    end )

    hook.Add( "PlayerGiveSWEP", "CFC_EntityStubber_DisableM9kSWEPS", function( _, class )
        if badClasses[class] then return false end
    end )
end

-- Disable bad sents
do
    local badClasses = {
        m9k_davy_crockett_explo = true,
        m9k_gdcwa_matador_90mm = true,
        m9k_gdcwa_rpg_heat = true,
        m9k_launched_davycrockett = true,
        m9k_launched_ex41 = true,
        m9k_launched_m79 = true,
        m9k_m202_rocket = true,
        m9k_nervegasnade = true,
        m9k_orbital_cannon = true,
        m9k_poison_parent = true,
        m9k_released_poison = true,
        m9k_sent_nuke_radiation = true,
    }

    local function isAmmo( class )
        return string.StartsWith( class, "m9k_ammo" )
    end

    hook.Add( "PreRegisterSENT", "CFC_EntityStubber_DisableM9kSENTs", function( _, class )
        if badClasses[class] then return false end
        if isAmmo( class ) then return false end
    end )

    hook.Add( "PlayerSpawnSENT", "CFC_EntityStubber_DisableM9kSENTs", function( _, class )
        if badClasses[class] then return false end
        if isAmmo( class ) then return false end
    end )
end

AddCSLuaFile( "cfc_entity_stubber/main_loader.lua" )
include( "cfc_entity_stubber/main_loader.lua" )
