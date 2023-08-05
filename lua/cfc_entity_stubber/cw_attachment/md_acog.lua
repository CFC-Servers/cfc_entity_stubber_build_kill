AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local attachment = cfcEntityStubber.getAttachment( "md_acog" )

    attachment.shadowMaskConfig = {
        w = 768,
        h = 768,
        wOff = 352,
        hOff = 352,
        maxOffset = 0,
        maskMaxStrength = 0,
        maxZoom = 416,
        posX = 1,
        posY = 1,
        flipAngles = false
    }

    cfcEntityStubber.applyAttachmentChange( attachment )
end )
