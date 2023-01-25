AddCSLuaFile()

cfcEntityStubber.registerStub( "m9k_m4a1", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Rifle:Base"

    weapon.Primary.RPM = 700
    weapon.Primary.ClipSize = 30
    weapon.Primary.KickUp = 1
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.23
    weapon.Primary.Automatic = true
    weapon.Primary.Ammo = "ar2"
    weapon.Primary.NumShots = 1
    weapon.Primary.Damage = 28
    weapon.Primary.Spread = 0.04
    weapon.Primary.IronAccuracy = 0.0055
end )


cfcEntityStubber.registerStub( "m9k_l85", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Rifle:Base"

    weapon.Primary.RPM = 700
    weapon.Primary.ClipSize = 30
    weapon.Primary.KickUp = 1
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.25
    weapon.Primary.Automatic = true
    weapon.Primary.Ammo = "ar2"
    weapon.Primary.NumShots = 1
    weapon.Primary.Damage = 25
    weapon.Primary.Spread = 0.043
    weapon.Primary.Sound = "an94.Single"
    weapon.Primary.SpreadZoomed = 0.005
end )

cfcEntityStubber.registerStub( "m9k_m416", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Rifle:Base"

    weapon.Primary.RPM = 675
    weapon.Primary.ClipSize = 30
    weapon.Primary.KickUp = 0.95
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.21
    weapon.Primary.Automatic = true
    weapon.Primary.Ammo = "ar2"
    weapon.Primary.NumShots = 1
    weapon.Primary.Damage = 28
    weapon.Primary.Spread = 0.04
    weapon.Primary.IronAccuracy = 0.0055
end )

cfcEntityStubber.registerStub( "m9k_acr", function( weapon )
    local weapon = cfcEntityStubber.getWeapon( weaponClass )
    weapon.Purpose = ""
    weapon.CFC_Category = "Rifle:Base"

    weapon.Primary.RPM = 725
    weapon.Primary.ClipSize = 30
    weapon.Primary.KickUp = 1.8
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.25
    weapon.Primary.Automatic = true
    weapon.Primary.Ammo = "ar2"
    weapon.Primary.NumShots = 1
    weapon.Primary.Damage = 20
    weapon.Primary.Spread = 0.05
    weapon.Primary.IronAccuracy = 0.01
end )

cfcEntityStubber.registerStub( "m9k_amd65", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "Rifle:Base"

    weapon.Primary.RPM = 690
    weapon.Primary.ClipSize = 30
    weapon.Primary.KickUp = 0.95
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.23
    weapon.Primary.Automatic = true
    weapon.Primary.Ammo = "ar2"
    weapon.Primary.NumShots = 1
    weapon.Primary.Damage = 28
    weapon.Primary.Spread = 0.04
    weapon.Primary.IronAccuracy = 0.01
end )
