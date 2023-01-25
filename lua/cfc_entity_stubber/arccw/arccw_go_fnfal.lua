AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "arccw_go_fnfal" )
    
    weapon.Damage = 80
    weapon.Primary.ClipSize = 120
end )
