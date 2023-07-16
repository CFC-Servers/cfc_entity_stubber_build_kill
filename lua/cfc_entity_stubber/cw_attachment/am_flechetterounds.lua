AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local attachment = cfcEntityStubber.getAttachment( "am_flechetterounds" )

    function attachment:attachFunc()
        self.Shots = 20
    end

    function attachment:detachFunc()
        self.Shots = self.Shots_Orig
    end

    cfcEntityStubber.applyAttachmentChange( attachment )
end )
