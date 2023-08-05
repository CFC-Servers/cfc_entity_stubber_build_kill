AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local attachment = cfcEntityStubber.getAttachment( "md_pso1" )

    attachment.shadowMaskConfig = {
        w = 768,
        h = 768,
        wOff = 256,
        hOff = 256,
        maxOffset = 0,
        maskMaxStrength = 0,
        maxZoom = 360,
        posX = 1,
        posY = 1,
        flipAngles = false
    }

    cfcEntityStubber.applyAttachmentChange( attachment )
end )
