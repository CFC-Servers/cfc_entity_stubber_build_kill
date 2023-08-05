AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local attachment = cfcEntityStubber.getAttachment( "bg_sg1scope" )

    attachment.shadowMaskConfig = {
        w = 1,
        h = 1,
        wOff = 352,
        hOff = 352,
        maxOffset = 0,
        maskMaxStrength = 0,
        maxZoom = 1000,
        posX = 1,
        posY = 1,
        flipAngles = false
    }

    cfcEntityStubber.applyAttachmentChange( attachment )
end )
