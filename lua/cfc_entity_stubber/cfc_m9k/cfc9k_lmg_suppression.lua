AddCSLuaFile()

cfcEntityStubber.registerStub( "m9k_minigun", function( weapon )
    weapon.Purpose = ""
    weapon.CFC_Category = "LMG:Suppression"

    weapon.Primary.Sound = "BlackVulcan.Single"

    weapon.ShouldDoMoveSpread = true
    weapon.Primary.RPM = 725
    weapon.Primary.ClipSize = 150
    weapon.Primary.KickUp = 0.9
    weapon.Primary.KickDown = 0
    weapon.Primary.KickHorizontal = 0.4
    weapon.Primary.NumShots = 2
    weapon.Primary.Damage = 20
    weapon.Primary.Spread = 0.03
end )
