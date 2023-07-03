AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local attachment = cfcEntityStubber.getAttachment( "am_flechetterounds" )

    function attachment:attachFunc() end
    function attachment:detachFunc() end
    cfcEntityStubber.applyAttachmentChange( attachment )
end )
