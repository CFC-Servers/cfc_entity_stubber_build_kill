AddCSLuaFile()

do
    local weapons = {
        "m9k_bizonp19",
        "m9k_smgp90",
        "m9k_thompson"
    }

    cfcEntityStubber.registerStub( weapons, function( weapon )
        weapon.Purpose = ""
        weapon.CFC_Category = "SMG:HighCap"

        weapon.Primary.RPM = 825
        weapon.Primary.ClipSize = 60
        weapon.Primary.KickUp = 1
        weapon.Primary.KickDown = 0
        weapon.Primary.KickHorizontal = 0.25
        weapon.Primary.Damage = 19
        weapon.Primary.Spread = 0.04
        weapon.Primary.IronAccuracy = 0.03
    end )
end
