hook.Add( "PreRegisterSWEP", "CFC_EntityStubber_AllowRunning", function( swep, _ )
    if swep and swep.Category == "M9k Pistols" then
        swep.CanShootWhileRunning = true
    end
end )
