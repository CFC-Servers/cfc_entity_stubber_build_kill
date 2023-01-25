AddCSLuaFile()

-- https://steamcommunity.com/sharedfiles/filedetails/?id=2268287057

-- lua/weapons/arccw_go_fnfal.lua
cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "arccw_go_fnfal" )
    
    weapon.Damage = 80
    weapon.Primary.ClipSize = 120
end )

-- lua/arccw/shared/attachments/go_fal_barrel_long.lua
cfcEntityStubber.registerStub( function()
    local attachment = cfcEntityStubber.getWeapon( "go_fal_barrel_long" )
    
    -- No movement penalty
    attachment.Mult_MoveSpeed = 1
end )
