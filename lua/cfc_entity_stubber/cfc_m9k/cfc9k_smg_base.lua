AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapons = {
        "m9k_mp5",
        "m9k_mp7",
        "m9k_mp5sd",
        "m9k_magpulpdr"
    }

    for _, weaponClass in ipairs( weapons ) do
        local weapon = cfcEntityStubber.getWeapon( weaponClass )
        weapon.Purpose = ""
        weapon.CFC_Category = "SMG:Base"

        weapon.Primary.RPM = 830
        weapon.Primary.ClipSize = 30
        weapon.Primary.KickUp = 1
        weapon.Primary.KickDown = 0
        weapon.Primary.KickHorizontal = 0.4
        weapon.Primary.Damage = 20
        weapon.Primary.Spread = 0.036
        weapon.Primary.IronAccuracy = 0.02
    end
end )

cfcEntityStubber.registerStub( function()
    local weapons = {
        "m9k_mp5",
        "m9k_magpulpdr"
    }

    for _, weaponClass in ipairs( weapons ) do
        local weapon = cfcEntityStubber.getWeapon( weaponClass )
        weapon.Purpose = ""
        weapon.CFC_Category = "SMG:Base"

        weapon.Primary.KickUp = 2
        weapon.Primary.RPM = 850
        weapon.Primary.Spread = 0.04
        weapon.Primary.IronAccuracy = 0.03
    end
end )
