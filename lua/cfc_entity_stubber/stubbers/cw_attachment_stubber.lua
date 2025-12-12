AddCSLuaFile()
cfcEntityStubber.registerStubber( "cw_attachment" )

function cfcEntityStubber.getAttachment( attachName )
    local attachment = CustomizableWeaponry.registeredAttachmentsSKey[attachName]

    return attachment
end

function cfcEntityStubber.applyAttachmentChange( attachment )
    CustomizableWeaponry:registerAttachment( attachment )

    if CLIENT then
        attachment["description"] = {}
        CustomizableWeaponry:createStatText( attachment )
    end
end
