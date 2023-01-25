AddCSLuaFile()

cfcEntityStubber.registerStub( "m9k_colt1911", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Pistol:Heavy"

    weapon.Primary.RPM = 425
    weapon.Primary.ClipSize = 7
    weapon.Primary.KickUp = 1
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.3
    weapon.Primary.Damage = 40
    weapon.Primary.Spread = 0.027
    weapon.Primary.IronAccuracy = 0.0028
end )

cfcEntityStubber.registerStub( "m9k_usp", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Pistol:Heavy"

    weapon.Primary.RPM = 425
    weapon.Primary.ClipSize = 9
    weapon.Primary.KickUp = 1
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.3
    weapon.Primary.Damage = 34
    weapon.Primary.Spread = 0.03
    weapon.Primary.IronAccuracy = 0.003
end )
