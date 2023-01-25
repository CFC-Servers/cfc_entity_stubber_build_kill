AddCSLuaFile()

cfcEntityStubber.registerStub( "m9k_sig_p229r", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Pistol:Light"

    weapon.Primary.RPM = 550
    weapon.Primary.ClipSize = 12
    weapon.Primary.KickUp = 0.85
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.15
    weapon.Primary.Damage = 24
    weapon.Primary.Spread = 0.025
    weapon.Primary.IronAccuracy = 0.001
end )

cfcEntityStubber.registerStub( "m9k_hk45", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Pistol:Light"

    weapon.Primary.RPM = 535
    weapon.Primary.ClipSize = 12
    weapon.Primary.KickUp = 0.9
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.15
    weapon.Primary.Damage = 24
    weapon.Primary.Spread = 0.022
    weapon.Primary.IronAccuracy = 0.0097
end )
