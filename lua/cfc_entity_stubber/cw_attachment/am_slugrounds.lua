AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local attachment = cfcEntityStubber.getAttachment( "am_slugrounds" )

    attachment.statModifiers = {
        DamageMult = 7.5,
        AimSpreadMult = 1.3
    }
    function attachment:attachFunc()
        self.Shots = 1
        self.ClumpSpread = nil
    end

    function attachment:detachFunc()
        self.Shots = self.Shots_Orig
        self.ClumpSpread = self.ClumpSpread_Orig
    end

    cfcEntityStubber.applyAttachmentChange( attachment )
end )
