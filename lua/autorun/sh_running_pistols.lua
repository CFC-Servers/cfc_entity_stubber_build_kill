hook.Add( "PreRegisterSWEP", "CFC_EntityStubber_AllowRunning", function( swep, class )
    swep.CanShootWhileRunning = true
end )
