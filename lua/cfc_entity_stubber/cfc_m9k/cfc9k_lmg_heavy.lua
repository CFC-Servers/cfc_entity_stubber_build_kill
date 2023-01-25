AddCSLuaFile()

cfcEntityStubber.registerStub( "m9k_m60", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "LMG:Heavy"

    weapon.ShouldDoMoveSpread = true
    weapon.Primary.RPM = 550
    weapon.Primary.ClipSize = 100
    weapon.Primary.KickUp = 1.3
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.55
    weapon.Primary.Damage = 40
    weapon.Primary.Spread = 0.065
    weapon.Primary.IronAccuracy = 0.005
    weapon.Primary.Ammo = "AirboatGun"
    weapon.ACF_DamageMult = 1.5
end )

cfcEntityStubber.registerStub( "m9k_pkm", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "LMG:Heavy"

    weapon.ShouldDoMoveSpread = true
    weapon.Primary.RPM = 550
    weapon.Primary.ClipSize = 100
    weapon.Primary.KickUp = 1.3
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.55
    weapon.Primary.Damage = 40
    weapon.Primary.Spread = 0.065
    weapon.Primary.IronAccuracy = 0.005
    weapon.Primary.Ammo = "AirboatGun"
    weapon.ACF_DamageMult = 1.5
end )
