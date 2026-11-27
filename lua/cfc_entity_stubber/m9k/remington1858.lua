AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "m9k_remington1858" )
    weapon.Primary.Damage = 38
    weapon.Primary.RPM = 300
    weapon.Primary.Automatic = true
    weapon.Primary.SpreadHip = 0.03
    weapon.Primary.SpreadIronSights = 0.02
end )
