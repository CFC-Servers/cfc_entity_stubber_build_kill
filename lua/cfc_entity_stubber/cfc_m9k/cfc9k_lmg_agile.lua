AddCSLuaFile()


cfcEntityStubber.registerStub( "m9k_m1918bar", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "LMG:Agile"

    weapon.ShouldDoMoveSpread = true
    weapon.Primary.RPM = 500
    weapon.Primary.ClipSize = 20
    weapon.Primary.KickUp = 1
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.32
    weapon.Primary.Damage = 40
    weapon.Primary.Spread = 0.05
    weapon.Primary.IronAccuracy = 0.007
end )

cfcEntityStubber.registerStub( "m9k_fg42", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "LMG:Agile"

    weapon.ShouldDoMoveSpread = true
    weapon.Primary.RPM = 525
    weapon.Primary.ClipSize = 20
    weapon.Primary.KickUp = 1
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.32
    weapon.Primary.Damage = 40
    weapon.Primary.Spread = 0.053
    weapon.Primary.IronAccuracy = 0.0073
end )
