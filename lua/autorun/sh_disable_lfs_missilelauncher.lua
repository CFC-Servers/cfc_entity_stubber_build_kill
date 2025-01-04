
do
    local badClasses = {
        weapon_lfsmissilelauncher = true,
    }

    hook.Add( "PreRegisterSWEP", "CFC_EntityStubber_DisableLfsMissileLauncher", function( _, class )
        if badClasses[class] then return false end
    end )
end