AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "m9k_remington1858" )
    weapon.Primary.RPM = 300
    weapon.Primary.Automatic = true
    weapon.Primary.SpreadHip = 0.05
    weapon.Primary.SpreadIronSights = 0.05
end )
