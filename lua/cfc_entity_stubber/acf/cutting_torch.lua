AddCSLuaFile()
cfcEntityStubber.registerStub( function()
    local cuttingTorch = cfcEntityStubber.getWeapon( "acf_torch" )
    cuttingTorch.SecondaryAttack = function() end
end )
