AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local attachment = cfcEntityStubber.getAttachment( "am_matchgrade" )

    function attachment:attachFunc() end
    function attachment:detachFunc() end
    cfcEntityStubber.applyAttachmentChange( attachment )
end )
