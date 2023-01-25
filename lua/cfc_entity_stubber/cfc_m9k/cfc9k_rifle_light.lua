AddCSLuaFile()

do
    local weapons = {
        "m9k_tar21",
        "m9k_honeybadger",
        "m9k_val",
        "m9k_f2000",
        "m9k_famas",
        "m9k_kac_pdw",
        "m9k_auga3"
    }

    cfcEntityStubber.registerStub( weapons, function( weapon )
        weapon.Purpose = ""
        weapon.CFC_Category = "Rifle:Light"

        weapon.Primary.RPM = 600
        weapon.Primary.ClipSize = 30
        weapon.Primary.KickUp = 0.6
        weapon.Primary.KickDown = 0
        weapon.Primary.KickHorizontal = 0.2
        weapon.Primary.Damage = 25
        weapon.Primary.Spread = 0.04
        weapon.Primary.IronAccuracy = 0.01
    end )
end

do
    local weapons = {
        "m9k_f2000",
        "m9k_honeybadger",
        "m9k_auga3"
    }

    cfcEntityStubber.registerStub( weapons, function( weapon )
        weapon.Purpose = ""
        weapon.CFC_Category = "Rifle:Light"

        weapon.Primary.SpreadBefore = 0.04
        weapon.Primary.SpreadZoomed = 0.002
        weapon.Primary.Damage = 20
    end )
end
