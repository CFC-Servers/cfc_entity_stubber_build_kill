AddCSLuaFile()

cfcEntityStubber.registerStub( "m9k_striker12", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Shotgun:HighCap"

    weapon.Primary.RPM = 325
    weapon.Primary.ClipSize = 12
    weapon.Primary.KickUp = 3
    weapon.Primary.KickDown = 1
    weapon.Primary.KickHorizontal = 1.2
    weapon.Primary.Automatic = true
    weapon.Primary.NumShots = 12
    weapon.Primary.Damage = 6
    weapon.Primary.Spread = 0.09
    weapon.Primary.IronAccuracy = 0.05
    weapon.ShellTime = 0.09
end )

cfcEntityStubber.registerStub( "m9k_usas", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Shotgun:HighCap"

    weapon.Primary.RPM = 325
    weapon.Primary.ClipSize = 20
    weapon.Primary.KickUp = 3
    weapon.Primary.KickDown = 1
    weapon.Primary.KickHorizontal = 1.2
    weapon.Primary.Automatic = true
    weapon.Primary.NumShots = 12
    weapon.Primary.Damage = 5
    weapon.Primary.Spread = 0.09
    weapon.Primary.IronAccuracy = 0.05
    weapon.ShellTime = 0.09
end )
