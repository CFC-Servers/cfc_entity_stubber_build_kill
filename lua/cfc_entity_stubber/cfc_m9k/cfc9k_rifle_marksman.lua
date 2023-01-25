AddCSLuaFile()

cfcEntityStubber.registerStub( "m9k_m14sp", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Rifle:Marksman"

    weapon.Primary.RPM = 300
    weapon.Primary.ClipSize = 15
    weapon.Primary.KickUp = 2
    weapon.Primary.KickDown = 1
    weapon.Primary.KickHorizontal = 0.2
    weapon.Primary.Automatic = false
    weapon.Primary.Ammo = "AirboatGun"
    weapon.Primary.Damage = 55
    weapon.Primary.Spread = 0.06
    weapon.Primary.IronAccuracy = 0.0001
    weapon.Primary.DefaultClip = 1001
end )

cfcEntityStubber.registerStub( "m9k_sl8", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Rifle:Marksman"

    weapon.Primary.RPM = 300
    weapon.Primary.ClipSize = 15
    weapon.Primary.KickUp = 2
    weapon.Primary.KickDown = 1
    weapon.Primary.KickHorizontal = 0.2
    weapon.Primary.Automatic = true
    weapon.Primary.Ammo = "AirboatGun"
    weapon.Primary.Damage = 49
    weapon.Primary.SpreadBefore = 0.065
    weapon.Primary.SpreadZoomed = 0.0005
    weapon.Primary.DefaultClip = 1000
end )

cfcEntityStubber.registerStub( "m9k_winchester73", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Rifle:Marksman"

    weapon.Primary.RPM = 70
    weapon.Primary.ClipSize = 7
    weapon.Primary.KickUp = 2
    weapon.Primary.KickDown = 1
    weapon.Primary.KickHorizontal = 0.3
    weapon.Primary.Automatic = false
    weapon.Primary.Ammo = "AirboatGun"
    weapon.Primary.Damage = 70
    weapon.Primary.Spread = 0.003
    weapon.Primary.IronAccuracy = 0.0001
    weapon.Primary.DefaultClip = 1000
end )
