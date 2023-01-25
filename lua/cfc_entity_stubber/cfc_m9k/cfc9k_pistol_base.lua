AddCSLuaFile()

cfcEntityStubber.registerStub( "m9k_m92beretta", function( weapon )
    weapon.Purpose = "A basic, all-around pistol"
    weapon.CFC_Category = "Pistol:Base"

    weapon.Primary.RPM = 525
    weapon.Primary.ClipSize = 12
    weapon.Primary.KickUp = 0.98
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.2
    weapon.Primary.Automatic = false
    weapon.Primary.Ammo = "pistol"
    weapon.Primary.NumShots = 1
    weapon.Primary.Damage = 28
    weapon.Primary.Spread = 0.018
    weapon.Primary.IronAccuracy = 0.0012
end )

cfcEntityStubber.registerStub( "m9k_luger", function( weapon )
    weapon.Purpose = "A basic, all-around pistol"
    weapon.CFC_Category = "Pistol:Base"

    weapon.Primary.RPM = 500
    weapon.Primary.ClipSize = 12
    weapon.Primary.KickUp = 0.98
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.2
    weapon.Primary.Automatic = false
    weapon.Primary.Ammo = "pistol"
    weapon.Primary.NumShots = 1
    weapon.Primary.Damage = 28
    weapon.Primary.Spread = 0.02
    weapon.Primary.IronAccuracy = 0.001
end )
