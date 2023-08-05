AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local attachment = cfcEntityStubber.getAttachment( "md_schmidt_shortdot" )

    attachment.shadowMaskConfig = {
        w = 1,
        h = 1,
        wOff = 384,
        hOff = 384,
        maxOffset = 0,
        maskMaxStrength = 0,
        maxZoom = 460,
        posX = 1,
        posY = 1,
        flipAngles = false
    }

    cfcEntityStubber.applyAttachmentChange( attachment )
end )
