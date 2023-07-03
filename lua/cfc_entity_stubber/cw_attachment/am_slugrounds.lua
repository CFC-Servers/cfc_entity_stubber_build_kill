AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local attachment = cfcEntityStubber.getAttachment( "am_slugrounds" )

    attachment.statModifiers = {
        DamageMult = 7.5,
        AimSpreadMult = 1.3
    }
    function attachment:attachFunc() end
    function attachment:detachFunc() end
    cfcEntityStubber.applyAttachmentChange( attachment )
end )
