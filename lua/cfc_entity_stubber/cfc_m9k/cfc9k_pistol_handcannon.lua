AddCSLuaFile()

cfcEntityStubber.registerStub( "m9k_model500", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Pistol:Handcannon"

    weapon.Primary.RPM = 45
    weapon.Primary.ClipSize = 5
    weapon.Primary.KickUp = 7
    weapon.Primary.KickDown = 3
    weapon.Primary.KickHorizontal = 2
    weapon.Primary.Damage = 90
    weapon.Primary.Spread = 0.04
    weapon.Primary.IronAccuracy = 0.0003
end )
