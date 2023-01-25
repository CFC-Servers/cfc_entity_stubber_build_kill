AddCSLuaFile()

cfcEntityStubber.registerStub( "m9k_dbarrel", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Shotgun:Elephant"

    weapon.Primary.RPM = 50
    weapon.Primary.ClipSize = 2
    weapon.Primary.KickUp = 6
    weapon.Primary.KickDown = 2
    weapon.Primary.KickHorizontal = 5
    weapon.Primary.NumShots = 12
    weapon.Primary.Damage = 15
    weapon.Primary.Spread = 0.07
end )
