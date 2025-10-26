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
applyBasicPatch( "m9k_acr", { Damage = 25, SpreadHip = 0.05, SpreadIronSights = 0.04, KickUp = 0.4, } )
applyBasicPatch( "m9k_ak47", { Damage = 25, RPM = 500, SpreadHip = 0.04, SpreadIronSights = 0.03, KickUp = 0.3, KickDown = 0.3, KickHorizontal = 0.3, }, { Instructions = "Less recoil, more spread.", } )
applyBasicPatch( "m9k_ak74", { Damage = 25, RPM = 500, SpreadHip = 0.01, SpreadIronSights = 0.0075, KickUp = 1.5, KickDown = 0.5, KickHorizontal = 0.5, }, { Instructions = "Less spread, more recoil.", } )
applyBasicPatch( "m9k_amd65", { Damage = 30, RPM = 700, SpreadHip = 0.025, SpreadIronSights = 0.015, } )
applyBasicPatch( "m9k_an94", { Damage = 18, }, { SelectiveFire = false, Instructions = "Alt fire disabled. No free x2 for you.", } )
applyBasicPatch( "m9k_val", { Damage = 20, } )
applyBasicPatch( "m9k_f2000", { Damage = 13, RPM = 550, SpreadHip = 0.015, SpreadIronSights = 0.01, KickUp = 0.15, KickDown = 0.15, KickHorizontal = 0.15, }, { Instructions = "The sniper's assault rifle.", } )
applyBasicPatch( "m9k_famas", { Damage = 25, KickUp = 2, KickDown = 2, }, { Instructions = "Feels lighter than usual...", } )
applyBasicPatch( "m9k_fal", { SpreadHip = 0.04, SpreadIronSights = 0.025, } )
applyBasicPatch( "m9k_g36", { Damage = 25, RPM = 400, KickUp = 0.6, KickDown = 0.6, KickHorizontal = 0.5, } )
applyBasicPatch( "m9k_m416", { KickHorizontal = 1.1, }, { Instructions = "The barrel feels loose...", } )
applyBasicPatch( "m9k_g3a3", { Damage = 35, ClipSize = 15, RPM = 275, SpreadHip = 0.02, SpreadIronSights = 0.015, KickUp = 0.5, KickDown = 0.3, KickHorizontal = 0.4, }, { Instructions = "Hits hard.", } )
applyBasicPatch( "m9k_l85", { Damage = 13, RPM = 675, SpreadHip = 0.015, SpreadIronSights = 0.0075, KickUp = 0.2, KickDown = 0.2, KickHorizontal = 0.2, }, { Instructions = "The sniper's assault rifle.", } )
applyBasicPatch( "m9k_m14sp", { ClipSize = 15, KickUp = 2, KickDown = 2, KickHorizontal = 2, }, { SelectiveFire = false, Instructions = "You might want to slow down your taps...", } )
applyBasicPatch( "m9k_m16a4_acog", { Damage = 15, RPM = 400, KickUp = 0.2, KickDown = 0.2, KickHorizontal = 0.2, }, { SelectiveFire = false, Instructions = "The sniper's tapper.", } )
applyBasicPatch( "m9k_m4a1", { SpreadHip = 0.06, SpreadIronSights = 0.05, }, { Instructions = "Best brought to knife fights.", } )
applyBasicPatch( "m9k_scar", { Damage = 15, } )
applyBasicPatch( "m9k_vikhr", { Damage = 12, RPM = 1200, }, { Instructions = "Fast!", } )
applyBasicPatch( "m9k_auga3", { Damage = 20, KickUp = -0.5, KickDown = -2, }, { Instructions = "Must be a manufacturing error.", } ) -- Downwards recoil!
applyBasicPatch( "m9k_tar21", { Damage = 20, SpreadHip = 0.03, SpreadIronSights = 0.02, } )

-- Machine Guns
applyBasicPatch( "m9k_ares_shrike", { Damage = 20, } )
applyBasicPatch( "m9k_fg42", { Damage = 20, } )
applyBasicPatch( "m9k_m1918bar", { Damage = 25, ClipSize = 20, } )
applyBasicPatch( "m9k_m249lmg", { Damage = 20, ClipSize = 100, } )
applyBasicPatch( "m9k_m60", { Damage = 25, } )
applyBasicPatch( "m9k_pkm", { Damage = 20, } )

-- Pistols
applyBasicPatch( "m9k_colt1911", { Damage = 20, RPM = 400, SpreadHip = 0.02, } )
applyBasicPatch( "m9k_coltpython", { Damage = 66, SpreadHip = 0.005, SpreadIronSights = 0.001, }, { Instructions = "Diet .357 Magnum.", } ) -- Barely able to 1-shot headshot with 25 armor at min dice.
applyBasicPatch( "m9k_deagle", { Damage = 32, RPM = 200, SpreadHip = 0.005, SpreadIronSights = 0.001, }, { Instructions = "Weaker than the Python, but faster too.", } ) -- (still not perfect accuracy).
applyBasicPatch( "m9k_glock", { Damage = 10, ClipSize = 30, } )
applyBasicPatch( "m9k_usp", { SpreadHip = 0.015, } )
applyBasicPatch( "m9k_hk45", { ClipSize = 24, SpreadHip = 0.05, SpreadIronSights = 0.03, KickUp = 0, KickDown = 0, KickHorizontal = 0, }, { Instructions = "The Gambler's Pistol.", } ) -- Gambler's pistol. Probably awful, but peak silly.
applyBasicPatch( "m9k_m29satan", { Damage = 66, RPM = 115, SpreadHip = 0.006, SpreadIronSights = 0.0006, }, { Instructions = "Diet .357 Magnum.", } )
applyBasicPatch( "m9k_m92beretta", { Damage = 18, } )
applyBasicPatch( "m9k_ragingbull", { Damage = 22, NumShots = 3, SpreadHip = 0.04, SpreadIronSights = 0.03, KickUp = 1, }, { Instructions = "Shotgun Revolver. 'nuff said.", } )
applyBasicPatch( "m9k_scoped_taurus", { Damage = 22, NumShots = 3, SpreadHip = 0.05, SpreadIronSights = 0.02, KickUp = 1, }, { Instructions = "I don't think a scope is going to help...", } )
applyBasicPatch( "m9k_remington1858", { SpreadHip = 0.02, } )
applyBasicPatch( "m9k_model3russian", { Damage = 35, } )
applyBasicPatch( "m9k_model500", { Damage = 45, SpreadHip = 0.01, SpreadIronSights = 0.0075, } )
applyBasicPatch( "m9k_model627", { Damage = 32, RPM = 200, SpreadHip = 0.005, SpreadIronSights = 0.001, KickUp = 1, KickDown = 0.5, KickHorizontal = 0.5, } )
applyBasicPatch( "m9k_sig_p229r", { SpreadHip = 0.01, SpreadIronSights = 0.0075,  } )

-- Shotguns
applyBasicPatch( "m9k_m3", { NumShots = 8, } )
applyBasicPatch( "m9k_browningauto5", { Damage = 7, NumShots = 8, RPM = 200, } )
--applyBasicPatch( "m9k_mossberg590", { Damage = 11, ClipSize = 4, SpreadHip = 0.04, SpreadIronSights = 0.04, KickUp = 3, KickHorizontal = 1.5, } ) -- Leaving this here in case the version below is too silly.
applyBasicPatch( "m9k_mossberg590", { Damage = 3, NumShots = 80, ClipSize = 4, SpreadHip = 0.1, SpreadIronSights = 0.1, KickUp = 3, KickHorizontal = 1.5, }, { Instructions = "You'll always hit something, that's for sure.", BulletPenetrate = function() return false end, BulletRicochet = function() return false end, } )
applyBasicPatch( "m9k_jackhammer", { Damage = 7, } )
applyBasicPatch( "m9k_spas12", { Damage = 6, NumShots = 10, } )
applyBasicPatch( "m9k_striker12", { KickUp = 10, KickDown = 10, }, { Instructions = "The Stargazer.", } ) -- THE STARGAZER RETURNS
applyBasicPatch( "m9k_usas", { ClipSize = 8, }, { Instructions = "Reloads quick! But...", } )
applyBasicPatch( "m9k_1897winchester", { SpreadHip = 0.04, SpreadIronSights = 0.04, } )
applyBasicPatch( "m9k_1887winchester", { SpreadHip = 0.04, SpreadIronSights = 0.04, } )

-- Sniper Rifles
applyBasicPatch( "m9k_barret_m82", { Damage = 90, RPM = 60, KickUp = 0.15, KickDown = 0.1, KickHorizontal = 0.15, }, { Instructions = "Slow and steady.", } )
applyBasicPatch( "m9k_svu", { SpreadHip = 0.1, }, { Instructions = "You might want to scope in.", } )
applyBasicPatch( "m9k_sl8", { Damage = 30, ClipSize = 20, } )
applyBasicPatch( "m9k_psg1", { SpreadHip = 0.1, }, { Instructions = "You might want to scope in.", } )
applyBasicPatch( "m9k_remington7615p", { Damage = 90, } )
applyBasicPatch( "m9k_dragunov", { Damage = 50, }, { Instructions = "Low damage, fast fire rate.\nGood for hip firing.", } )
applyBasicPatch( "m9k_svt40", { Damage = 40, SpreadHip = 0.005, }, { Instructions = "Low damage, fast fire rate.\nGood for hip firing.", } )

-- Submachine Guns
applyBasicPatch( "m9k_honeybadger", { Damage = 22, } )
applyBasicPatch( "m9k_bizonp19", { Damage = 18, ClipSize = 40, } )
applyBasicPatch( "m9k_smgp90", { Damage = 15, KickUp = 0.8, } )
applyBasicPatch( "m9k_mp5", { Damage = 18, SpreadHip = 0.04, SpreadIronSights = 0.03, } )
applyBasicPatch( "m9k_mp7", { Damage = 20, } )
applyBasicPatch( "m9k_vector", { Damage = 15, SpreadHip = 0.035, SpreadIronSights = 0.017, } )
applyBasicPatch( "m9k_magpulpdr", { Damage = 20, } )
applyBasicPatch( "m9k_mp40", { Damage = 18 } )
applyBasicPatch( "m9k_mp5sd", { Damage = 15, ClipSize = 40, SpreadHip = 0.02, } )
applyBasicPatch( "m9k_mp9", { ClipSize = 20, } )
applyBasicPatch( "m9k_tec9", { ClipSize = 40, RPM = 2000, SpreadHip = 0.02, KickUp = 1, KickHorizontal = 0.5, }, { Instructions = "Fast, but at what cost?", } )
applyBasicPatch( "m9k_thompson", { KickUp = 1, KickHorizontal = 0.8, } )
