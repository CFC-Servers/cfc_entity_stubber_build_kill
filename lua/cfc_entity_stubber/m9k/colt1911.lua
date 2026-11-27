AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "m9k_colt1911" )
    weapon.Primary.Damage = 22
    weapon.Primary.SpreadHip = 0.02
end )
