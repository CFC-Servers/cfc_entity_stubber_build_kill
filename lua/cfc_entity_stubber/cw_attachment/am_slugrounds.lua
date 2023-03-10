AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local attachment = cfcEntityStubber.getAttachment( "am_slugrounds" )

    attachment.statModifiers = {
        DamageMult = 7.5,
        AimSpreadMult = 1.3
    }

    cfcEntityStubber.applyAttachmentChange( attachment )
end )
