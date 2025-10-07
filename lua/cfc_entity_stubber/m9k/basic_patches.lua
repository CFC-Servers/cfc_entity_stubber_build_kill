AddCSLuaFile()

-- https://github.com/CFC-Servers/m9k_monorepo/tree/main/lua/weapons

-- Basic patches to a bunch of m9k weapons
local function applyBasicPatch( class, primaryChanges, swepChanges )
    cfcEntityStubber.registerStub( function()
        local weapon = cfcEntityStubber.getWeapon( class )
        local primary = weapon.Primary

        -- SWEP.Primary.*
        if primaryChanges then
            for k, v in pairs( primaryChanges ) do
                primary[k] = v
            end
        end

        -- SWEP.*
        if swepChanges then
            for k, v in pairs( swepChanges ) do
                weapon[k] = v
            end
        end
    end )
end


-- Assault Rifles
applyBasicPatch( "m9k_acr", { Damage = 25, SpreadHip = 0.05, SpreadIronSights = 0.035, KickUp = 0.4, } )
applyBasicPatch( "m9k_ak47", { Damage = 25, RPM = 600, SpreadHip = 0.04, SpreadIronSights = 0.02, KickUp = 0.3, KickHorizontal = 0.3, } )
applyBasicPatch( "m9k_ak74", { Damage = 30, RPM = 500, SpreadHip = 0.01, SpreadIronSights = 0.005, KickUp = 1, KickHorizontal = 0.5, } )
applyBasicPatch( "m9k_amd65", { Damage = 30, SpreadHip = 0.025, SpreadIronSights = 0.015, } )
applyBasicPatch( "m9k_val", { Damage = 25, } )
applyBasicPatch( "m9k_f2000", { Damage = 15, RPM = 550, SpreadHip = 0.015, SpreadIronSights = 0.01, KickUp = 0.2, KickDown = 0.2, KickHorizontal = 0.2, } )
applyBasicPatch( "m9k_famas", { Damage = 25, KickUp = 2.5, KickDown = 2.5, } )
applyBasicPatch( "m9k_fal", { SpreadHip = 0.04, SpreadIronSights = 0.02, } )
applyBasicPatch( "m9k_g36", { Damage = 25, RPM = 400, } )
applyBasicPatch( "m9k_m416", { KickHorizontal = 1.25, } )
applyBasicPatch( "m9k_g3a3", { Damage = 35, ClipSize = 15, RPM = 300, SpreadHip = 0.015, SpreadIronSights = 0.01, } )
applyBasicPatch( "m9k_l85", { Damage = 15, RPM = 675, SpreadHip = 0.015, SpreadIronSights = 0.0075, KickUp = 0.2, KickDown = 0.2, KickHorizontal = 0.2, } )
applyBasicPatch( "m9k_m14sp", { ClipSize = 15, KickUp = 2, KickDown = 2, KickHorizontal = 2, }, { SelectiveFire = false, } )
applyBasicPatch( "m9k_m16a4_acog", { Damage = 15, KickUp = 0.2, KickDown = 0.2, KickHorizontal = 0.2, }, { SelectiveFire = false, } )
applyBasicPatch( "m9k_m4a1", { SpreadHip = 0.05, SpreadIronSights = 0.025, } )
applyBasicPatch( "m9k_scar", { Damage = 15, } )
applyBasicPatch( "m9k_vikhr", { Damage = 10, RPM = 1200, } )
applyBasicPatch( "m9k_auga3", { Damage = 20, KickDown = -2, } )
applyBasicPatch( "m9k_tar21", { Damage = 20, SpreadHip = 0.03, SpreadIronSights = 0.02, } )

-- Machine Guns
applyBasicPatch( "m9k_m1918bar", { Damage = 30, ClipSize = 25, } )
applyBasicPatch( "m9k_pkm", { Damage = 20, } )
applyBasicPatch( "m9k_fg42", { Damage = 20, } )

-- Pistols
applyBasicPatch( "m9k_glock", { Damage = 15, ClipSize = 20, } )

-- Shotguns
applyBasicPatch( "m9k_m3", { NumShots = 8, } )
applyBasicPatch( "m9k_browningauto5", { RPM = 200, NumShots = 8, } )
applyBasicPatch( "m9k_mossberg590", { Damage = 11, ClipSize = 4, SpreadHip = 0.04, SpreadIronSights = 0.04, KickUp = 3, KickHorizontal = 1.5, } )
applyBasicPatch( "m9k_jackhammer", { Damage = 7, } )
applyBasicPatch( "m9k_spas12", { Damage = 2, NumShots = 15, } )
applyBasicPatch( "m9k_striker12", { KickUp = 10, KickDown = 10, } ) -- THE STARGAZER RETURNS
applyBasicPatch( "m9k_usas", { ClipSize = 4, } )
applyBasicPatch( "m9k_1887winchester", { SpreadHip = 0.05, SpreadIronSights = 0.05, } )

-- Sniper Rifles
applyBasicPatch( "m9k_barret_m82", { Damage = 90, RPM = 60, } )
applyBasicPatch( "m9k_svu", { SpreadHip = 0.2, } )
applyBasicPatch( "m9k_sl8", { Damage = 30, ClipSize = 20, } )
applyBasicPatch( "m9k_dragunov", { Damage = 50, } )
applyBasicPatch( "m9k_svt40", { Damage = 40, SpreadHip = 0.005, } )

-- Submachine Guns
applyBasicPatch( "m9k_bizonp19", { Damage = 20, ClipSize = 40, } )
applyBasicPatch( "m9k_mp7", { Damage = 20, } )
applyBasicPatch( "m9k_vector", { SpreadHip = 0.035, SpreadIronSights = 0.17, } )
applyBasicPatch( "m9k_magpulpdr", { Damage = 20, } )
applyBasicPatch( "m9k_mp40", { Damage = 20 } )
applyBasicPatch( "m9k_mp5sd", { Damage = 15, ClipSize = 40, SpreadHip = 0.02, } )
applyBasicPatch( "m9k_mp9", { ClipSize = 20, } )
applyBasicPatch( "m9k_tec9", { ClipSize = 40, RPM = 2000, KickUp = 1, KickHorizontal = 0.5, } )
applyBasicPatch( "m9k_thompson", { KickUp = 1, KickHorizontal = 0.8, } )
