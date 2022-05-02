AddCSLuaFile()
-- Stupid method but these fucking weapons don't use a base so it's the only way.
local cssWeapons = {
    "weapon_elite",
    "weapon_p228",
    "weapon_glock",
    "weapon_aug",
    "weapon_famas",
    "weapon_ak47",
    "weapon_g3sg1",
    "weapon_p90",
    "weapon_fiveseven",
    "weapon_galil",
    "weapon_mac10",
    "weapon_usp",
    "weapon_mp5navy",
    "weapon_ump45",
    "weapon_sg550",
    "weapon_sg552",
    "weapon_m3",
    "weapon_xm1014",
    "weapon_m249",
    "weapon_awp",
    "weapon_m4a1",
    "weapon_deagle",
    "weapon_tmp",
    "weapon_scout"
}

cfcEntityStubber.registerStub( function()
    for _, weaponClass in ipairs( cssWeapons ) do
        print( weaponClass )
        local weapon = cfcEntityStubber.getWeapon( weaponClass )
        weapon.Primary.MaxAmmo = weapon.Primary.MaxAmmo * 10
    end
end )
