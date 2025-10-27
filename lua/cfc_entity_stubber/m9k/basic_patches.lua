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


----- Assault Rifles -----
applyBasicPatch( "m9k_acr",
    -- og: { Damage = 30, RPM = 825, ClipSize = 30, SpreadHip = 0.025, SpreadIronSights = 0.015, KickUp = 0.3, KickDown = 0.3, KickHorizontal = 0.3, }
    { Damage = 25, SpreadHip = 0.05, SpreadIronSights = 0.04, KickUp = 0.4, }
)
applyBasicPatch( "m9k_ak47",
    -- og: { Damage = 30, RPM = 600, ClipSize = 30, SpreadHip = 0.023, SpreadIronSights = 0.013, KickUp = 0.3, KickDown = 0.3, KickHorizontal = 0.3, }
    { Damage = 25, RPM = 500, SpreadHip = 0.04, SpreadIronSights = 0.03, KickUp = 0.3, KickDown = 0.3, KickHorizontal = 0.3, },
    { Instructions = "Less recoil, more spread.", }
)
applyBasicPatch( "m9k_ak74",
    -- og: { Damage = 31, RPM = 600, ClipSize = 30, SpreadHip = 0.02, SpreadIronSights = 0.01, KickUp = 0.4, KickDown = 0.4, KickHorizontal = 0.4, }
    { Damage = 25, RPM = 500, SpreadHip = 0.01, SpreadIronSights = 0.0075, KickUp = 1.5, KickDown = 0.5, KickHorizontal = 0.5, },
    { Instructions = "Less spread, more recoil.", }
)
applyBasicPatch( "m9k_amd65",
    -- og: { Damage = 31, RPM = 750, ClipSize = 20, SpreadHip = 0.021, SpreadIronSights = 0.011, KickUp = 0.7, KickDown = 0.2, KickHorizontal = 0.4, }
    { Damage = 30, RPM = 700, SpreadHip = 0.025, SpreadIronSights = 0.015, }
)
applyBasicPatch( "m9k_an94",
    -- og: { Damage = 31, RPM = 600, ClipSize = 30, SpreadHip = 0.015, SpreadIronSights = 0.005, KickUp = 0.3, KickDown = 0.1, KickHorizontal = 0.3, }
    { Damage = 18, SpreadHip = 0.02, SpreadIronSights = 0.015, },
    { SelectiveFire = false, Instructions = "Alt fire disabled. No free x2 for you.", }
)
applyBasicPatch( "m9k_val",
    -- og: { Damage = 27, RPM = 900, ClipSize = 20, SpreadHip = 0.019, SpreadIronSights = 0.008, KickUp = 0.3, KickDown = 0.3, KickHorizontal = 0.5, }
    { Damage = 20, }
)
applyBasicPatch( "m9k_f2000",
    -- og: { Damage = 23, RPM = 850, ClipSize = 30, SpreadHip = 0.025, SpreadIronSights = 0.015, KickUp = 0.4, KickDown = 0.4, KickHorizontal = 0.4, }
    { Damage = 13, RPM = 550, SpreadHip = 0.015, SpreadIronSights = 0.01, KickUp = 0.15, KickDown = 0.15, KickHorizontal = 0.15, },
    { Instructions = "The sniper's assault rifle.", }
)
applyBasicPatch( "m9k_famas",
    -- og: { Damage = 29, RPM = 950, ClipSize = 30, SpreadHip = 0.025, SpreadIronSights = 0.015, KickUp = 0.4, KickDown = 0.4, KickHorizontal = 0.4  }
    { Damage = 25, KickUp = 2, KickDown = 2, },
    -- og: { KickUpMultiplier = 2, }
    { KickUpMultiplier = 1.5, Scoped = true, Instructions = "Feels lighter than usual...", }
    -- Scoped = true makes ADS not cut the recoil in half, without any other noticeable side effects.
)
applyBasicPatch( "m9k_fal",
    -- og: { Damage = 30, RPM = 750, ClipSize = 20, SpreadHip = 0.02, SpreadIronSights = 0.01, KickUp = 0.5, KickDown = 0.3, KickHorizontal = 0.5, }
    { SpreadHip = 0.04, SpreadIronSights = 0.03, }
)
applyBasicPatch( "m9k_g36",
    -- og: { Damage = 28, RPM = 750, ClipSize = 30, SpreadHip = 0.02, SpreadIronSights = 0.01, KickUp = 0.3, KickDown = 0.3, KickHorizontal = 0.3, }
    { Damage = 25, RPM = 400, SpreadHip = 0.0125, SpreadIronSights = 0.01, KickUp = 0.6, KickDown = 0.5, KickHorizontal = 0.4, },
    { Instructions = "Slower, but more accurate.", }
)
applyBasicPatch( "m9k_m416",
    -- og: { Damage = 30, RPM = 800, ClipSize = 30, SpreadHip = 0.025, SpreadIronSights = 0.015, KickUp = 0.4, KickDown = 0.4, KickHorizontal = 0.6, }
    { KickHorizontal = 1.1, },
    { Instructions = "The barrel feels loose...", }
)
applyBasicPatch( "m9k_g3a3",
    -- og: { Damage = 33, RPM = 550, ClipSize = 20, SpreadHip = 0.026, SpreadIronSights = 0.016, KickUp = 0.4, KickDown = 0.3, KickHorizontal = 0.5, }
    { Damage = 35, RPM = 275, ClipSize = 15, SpreadHip = 0.02, SpreadIronSights = 0.015, KickUp = 0.5, KickDown = 0.3, KickHorizontal = 0.4, },
    { Instructions = "Hits hard.", }
)
applyBasicPatch( "m9k_l85",
    -- og: { Damage = 29, RPM = 675, ClipSize = 30, SpreadHip = 0.023, SpreadIronSights = 0.015, KickUp = 0.4, KickDown = 0.4, KickHorizontal = 0.5, }
    { Damage = 13, RPM = 675, SpreadHip = 0.015, SpreadIronSights = 0.0075, KickUp = 0.2, KickDown = 0.2, KickHorizontal = 0.2, },
    { Instructions = "The sniper's assault rifle.", }
)
applyBasicPatch( "m9k_m14sp",
    -- og: { Damage = 32, RPM = 750, ClipSize = 20, SpreadHip = 0.01, SpreadIronSights = 0.001, KickUp = 0.6, KickDown = 0.6, KickHorizontal = 0.6, }
    { ClipSize = 15, KickUp = 2, KickDown = 2, KickHorizontal = 2, },
    { SelectiveFire = false, Instructions = "You might want to slow down your taps...", }
)
applyBasicPatch( "m9k_m16a4_acog",
    -- og: { Damage = 30, RPM = 850, ClipSize = 30, SpreadHip = 0.015, SpreadIronSights = 0.01, KickUp = 0.4, KickDown = 0.4, KickHorizontal = 0.6, }
    { Damage = 15, RPM = 400, KickUp = 0.2, KickDown = 0.2, KickHorizontal = 0.2, },
    { SelectiveFire = false, Instructions = "The sniper's tapper.", }
)
applyBasicPatch( "m9k_m4a1",
    -- og: { Damage = 30, RPM = 800, ClipSize = 30, SpreadHip = 0.02, SpreadIronSights = 0.01, KickUp = 0.4, KickDown = 0.4, KickHorizontal = 0.5, }
    { SpreadHip = 0.08, SpreadIronSights = 0.07, },
    { Instructions = "Best brought to knife fights.", }
)
applyBasicPatch( "m9k_scar",
    -- og: { Damage = 30, RPM = 625, ClipSize = 30, SpreadHip = 0.02, SpreadIronSights = 0.01, KickUp = 0.4, KickDown = 0.3, KickHorizontal = 0.3, }
    { Damage = 15, }
)
applyBasicPatch( "m9k_vikhr",
    -- og: { Damage = 29, RPM = 900, ClipSize = 30, SpreadHip = 0.02, SpreadIronSights = 0.014, KickUp = 0.3, KickDown = 0.3, KickHorizontal = 0.5, }
    { Damage = 12, RPM = 1200, },
    { Instructions = "Fast!", }
)
applyBasicPatch( "m9k_auga3",
    -- og: { Damage = 22, RPM = 700, ClipSize = 30, SpreadHip = 0.025, SpreadIronSights = 0.02, KickUp = 0.4, KickDown = 0.4, KickHorizontal = 0.5, }
    { Damage = 20, SpreadHip = 0.02, SpreadIronSights = 0.0175, KickUp = -0.75, KickDown = -1.5, },
    { Instructions = "Must be a manufacturing error.", }
    -- Downwards recoil!
)
applyBasicPatch( "m9k_tar21",
    -- og: { Damage = 30, RPM = 900, ClipSize = 30, SpreadHip = 0.027, SpreadIronSights = 0.016, KickUp = 0.3, KickDown = 0.3, KickHorizontal = 0.3, }
    { Damage = 20, SpreadHip = 0.03, SpreadIronSights = 0.02, }
)

----- Machine Guns -----
applyBasicPatch( "m9k_ares_shrike",
    -- og: { Damage = 30, RPM = 650, ClipSize = 200, SpreadHip = 0.03, SpreadIronSights = 0.02, KickUp = 0.6, KickDown = 0.4, KickHorizontal = 0.5, }
    { Damage = 20, }
)
applyBasicPatch( "m9k_fg42",
    -- og: { Damage = 33, RPM = 900, ClipSize = 20, SpreadHip = 0.035, SpreadIronSights = 0.01, KickUp = 0.5, KickDown = 0.3, KickHorizontal = 0.4, }
    { Damage = 16, ClipSize = 30, SpreadHip = 0.035, SpreadIronSights = 0.02, }
)
applyBasicPatch( "m9k_m1918bar",
    -- og: { Damage = 40, RPM = 450, ClipSize = 20, SpreadHip = 0.025, SpreadIronSights = 0.015, KickUp = 0.6, KickDown = 0.4, KickHorizontal = 0.5, }
    { Damage = 25, RPM = 400, ClipSize = 20, SpreadHip = 0.025, SpreadIronSights = 0.02, }
)
applyBasicPatch( "m9k_m249lmg",
    -- og: { Damage = 27, RPM = 855, ClipSize = 150, SpreadHip = 0.035, SpreadIronSights = 0.024, KickUp = 0.6, KickDown = 0.4, KickHorizontal = 0.5, }
    { Damage = 20, ClipSize = 100, }
)
applyBasicPatch( "m9k_m60",
    -- og: { Damage = 33, RPM = 575, ClipSize = 200, SpreadHip = 0.035, SpreadIronSights = 0.025, KickUp = 0.6, KickDown = 0.4, KickHorizontal = 0.5, }
    { Damage = 25, }
)
applyBasicPatch( "m9k_pkm",
    -- og: { Damage = 33, RPM = 750, ClipSize = 100, SpreadHip = 0.035, SpreadIronSights = 0.02, KickUp = 0.6, KickDown = 0.3, KickHorizontal = 0.5, }
    { Damage = 20, }
)

----- Pistols -----
applyBasicPatch( "m9k_colt1911",
    -- og: { Damage = 17, RPM = 700, ClipSize = 7, SpreadHip = 0.025, SpreadIronSights = 0.015, KickUp = 0.4, KickDown = 0.3, KickHorizontal = 0.3, }
    { Damage = 20, RPM = 400, SpreadHip = 0.02, }
)
applyBasicPatch( "m9k_coltpython",
    -- og: { Damage = 29, RPM = 115, ClipSize = , SpreadHip = 0.02, SpreadIronSights = 0.01, KickUp = 1, KickDown = 0.5, KickHorizontal = 0.5, }
    { Damage = 66, SpreadHip = 0.005, SpreadIronSights = 0.001, },
    { Instructions = "Diet .357 Magnum.", }
    -- Barely able to 1-shot headshot with 25 armor at min dice.
)
applyBasicPatch( "m9k_deagle",
    -- og: { Damage = 30, RPM = 600, ClipSize = 7, SpreadHip = 0.025, SpreadIronSights = 0.015, KickUp = 1, KickDown = 0.5, KickHorizontal = 0.5, }
    { Damage = 33, RPM = 250, SpreadHip = 0.005, SpreadIronSights = 0.001, },
    { Instructions = "Weaker than the Python, but faster too.", }
)
applyBasicPatch( "m9k_glock",
    -- og: { Damage = 12, RPM = 1200, ClipSize = 32, SpreadHip = 0.03, SpreadIronSights = 0.02, KickUp = 0.4, KickDown = 0.3, KickHorizontal = 0.3, }
    { Damage = 10, ClipSize = 30, }
)
applyBasicPatch( "m9k_usp",
    -- og: { Damage = 16, RPM = 750, ClipSize = 15, SpreadHip = 0.02, SpreadIronSights = 0.01, KickUp = 0.3, KickDown = 0.3, KickHorizontal = 0.3, }
    { SpreadHip = 0.015, }
)
applyBasicPatch( "m9k_hk45",
    -- og: { Damage = 25, RPM = 750, ClipSize = 8, SpreadHip = 0.025, SpreadIronSights = 0.015, KickUp = 0.4, KickDown = 0.3, KickHorizontal = 0.3, }
    { ClipSize = 24, SpreadHip = 0.05, SpreadIronSights = 0.03, KickUp = 0, KickDown = 0, KickHorizontal = 0, },
    { Instructions = "The Gambler's Pistol.", }
    -- Gambler's pistol. Probably awful, but peak silly.
)
applyBasicPatch( "m9k_m29satan",
    -- og: { Damage = 32, RPM = 115, ClipSize = 6, SpreadHip = 0.015, SpreadIronSights = 0.01, KickUp = 1, KickDown = 0.5, KickHorizontal = 0.5, }
    { Damage = 66, RPM = 115, SpreadHip = 0.006, SpreadIronSights = 0.0006, },
    { Instructions = "Diet .357 Magnum.", }
)
applyBasicPatch( "m9k_m92beretta",
    -- og: { Damage = 14, RPM = 500, ClipSize = 15, SpreadHip = 0.027, SpreadIronSights = 0.019, KickUp = 1, KickDown = 0.5, KickHorizontal = 0.5, }
    { Damage = 18, }
)
applyBasicPatch( "m9k_ragingbull",
    -- og: { Damage = 31, NumShots = 1, RPM = 115, ClipSize = 6, SpreadHip = 0.02, SpreadIronSights = 0.001, KickUp = 1, KickDown = 0.5, KickHorizontal = 0.5, }
    { Damage = 22, NumShots = 3, SpreadHip = 0.04, SpreadIronSights = 0.03, KickUp = 1, },
    { Instructions = "Shotgun Revolver. 'nuff said.", }
)
applyBasicPatch( "m9k_scoped_taurus",
    -- og: { Damage = 31, NumShots = 1, RPM = 115, ClipSize = 6, SpreadHip = 0.02, SpreadIronSights = 0.0001, KickUp = 10, KickDown = 0.5, KickHorizontal = 1, }
    { Damage = 33, SpreadHip = 0.02, SpreadIronSights = 0.0001, KickUp = 1, KickDown = 0.5, KickHorizontal = 1, },
    { Instructions = "For puritans who don't want buckshot in their pistols.\nAlso has a scope, I'm sure that's normal.", }
)
applyBasicPatch( "m9k_remington1858",
    -- og: { Damage = 34, RPM = 150, ClipSize = 6, SpreadHip = 0.025, SpreadIronSights = 0.012, KickUp = 0.9, KickDown = 0.5, KickHorizontal = 0.4, }
    { SpreadHip = 0.02, }
)
applyBasicPatch( "m9k_model3russian",
    -- og: { Damage = 30, RPM = 115, ClipSize = 6, SpreadHip = 0.02, SpreadIronSights = 0.01, KickUp = 1, KickDown = 0.5, KickHorizontal = 0.5, }
    { Damage = 35, }
)
applyBasicPatch( "m9k_model500",
    -- og: { Damage = 40, RPM = 100, ClipSize = 5, SpreadHip = 0.02, SpreadIronSights = 0.015, KickUp = 1, KickDown = 0.3, KickHorizontal = 1, }
    { Damage = 45, SpreadHip = 0.01, SpreadIronSights = 0.0075, }
)
applyBasicPatch( "m9k_model627",
    -- og: { Damage = 20, RPM = 120, ClipSize = 6, SpreadHip = 0.01, SpreadIronSights = 0.001, KickUp = 0.3, KickDown = 0.3, KickHorizontal = 0.3, }
    { Damage = 32, RPM = 200, SpreadHip = 0.005, SpreadIronSights = 0.001, KickUp = 1, KickDown = 0.5, KickHorizontal = 0.5, }
)
applyBasicPatch( "m9k_sig_p229r",
    -- og: { Damage = 17, RPM = 500, ClipSize = 12, SpreadHip = 0.025, SpreadIronSights = 0.015, KickUp = 0.4, KickDown = 0.3, KickHorizontal = 0.3, }
    { SpreadHip = 0.01, SpreadIronSights = 0.0075,  }
)

----- Shotguns -----
applyBasicPatch( "m9k_m3",
    -- og: { Damage = 10, NumShots = 9, RPM = 70, ClipSize = 8, SpreadHip = 0.0326, SpreadIronSights = 0.0326, KickUp = 0.8, KickDown = 0.5, KickHorizontal = 0.3, }
    { NumShots = 8, }
)
applyBasicPatch( "m9k_browningauto5",
    -- og: { Damage = 10, NumShots = 9, RPM = 250, ClipSize = 6, SpreadHip = 0.03, SpreadIronSights = 0.03, KickUp = 1, KickDown = 0.8, KickHorizontal = 0.6, }
    { Damage = 7, NumShots = 8, RPM = 200, }
)
applyBasicPatch( "m9k_mossberg590",
    -- og: { Damage = 9, NumShots = 10, RPM = 75, ClipSize = 8, SpreadHip = 0.03, SpreadIronSights = 0.03, KickUp = 1, KickDown = 0.8, KickHorizontal = 0.8, }
    { Damage = 3, NumShots = 80, ClipSize = 4, SpreadHip = 0.1, SpreadIronSights = 0.1, KickUp = 3, KickHorizontal = 1.5, },
    { Instructions = "You'll always hit something, that's for sure.", BulletPenetrate = function() return false end, BulletRicochet = function() return false end, }
    --{ Damage = 11, ClipSize = 4, SpreadHip = 0.04, SpreadIronSights = 0.04, KickUp = 3, KickHorizontal = 1.5, } -- Leaving this here in case the version above is too silly.
)
applyBasicPatch( "m9k_jackhammer",
    -- og: { Damage = 10, NumShots = 6, RPM = 240, ClipSize = 10, SpreadHip = 0.045, SpreadIronSights = 0.045, KickUp = 1, KickDown = 0.5, KickHorizontal = 0.4, }
    { Damage = 7, }
)
applyBasicPatch( "m9k_spas12",
    -- og: { Damage = 10, NumShots = 10, RPM = 350, ClipSize = 8, SpreadHip = 0.03, SpreadIronSights = 0.03, KickUp = 1.5, KickDown = 0.3, KickHorizontal = 0.7, }
    { Damage = 6, NumShots = 10, }
)
applyBasicPatch( "m9k_striker12",
    -- og: { Damage = 8, NumShots = 6, RPM = 365, ClipSize = 12, SpreadHip = 0.04, SpreadIronSights = 0.04, KickUp = 4, KickDown = 0.5, KickHorizontal = 0.6, }
    { KickUp = 10, KickDown = 10, },
    -- og: { KickUpMultiplier = 2, }
    { KickUpMultiplier = 1.25, Scoped = true, Instructions = "The Stargazer.", }
)
applyBasicPatch( "m9k_usas",
    -- og: { Damage = 7, NumShots = 10, RPM = 260, ClipSize = 20, SpreadHip = 0.048, SpreadIronSights = 0.048, KickUp = 1, KickDown = 0.4, KickHorizontal = 0.7, }
    { ClipSize = 8, },
    { Instructions = "Reloads quick! But...", }
)
applyBasicPatch( "m9k_1897winchester",
    -- og: { Damage = 10, NumShots = 11, RPM = 70, ClipSize = 4, SpreadHip = 0.04, SpreadIronSights = 0.04, KickUp = 0.9, KickDown = 0.6, KickHorizontal = 0.4, }
    { Damage = 10, NumShots = 11, SpreadHip = 0.04, SpreadIronSights = 0.04, }
)
applyBasicPatch( "m9k_1887winchester",
    -- og: { Damage = 10, NumShots = 10, RPM = 70, ClipSize = 4, SpreadHip = 0.042, SpreadIronSights = 0.042, KickUp = 1, KickDown = 0.8, KickHorizontal = 0.6, }
    { Damage = 10, NumShots = 11, SpreadHip = 0.04, SpreadIronSights = 0.04, }
)

----- Sniper Rifles -----
applyBasicPatch( "m9k_barret_m82",
    -- og: { Damage = 110, RPM = 200, ClipSize = 10, SpreadHip = 0.01, SpreadIronSights = 0.00001, KickUp = 1, KickDown = 1, KickHorizontal = 1, }
    { Damage = 90, RPM = 60, KickUp = 0.15, KickDown = 0.1, KickHorizontal = 0.15, },
    { Instructions = "Slow and steady.", }
)
applyBasicPatch( "m9k_svu",
    -- og: { Damage = 93, RPM = 400, ClipSize = 10, SpreadHip = 0.01, SpreadIronSights = 0.0001, KickUp = 1, KickDown = 1, KickHorizontal = 1, }
    { SpreadHip = 0.1, },
    { Instructions = "You might want to scope in.", }
)
applyBasicPatch( "m9k_sl8",
    -- og: { Damage = 60, RPM = 300, ClipSize = 30, SpreadHip = 0.015, SpreadIronSights = 0.001, KickUp = 0.6, KickDown = 0.6, KickHorizontal = 0.6, }
    { Damage = 25, ClipSize = 20, }
)
applyBasicPatch( "m9k_psg1",
    -- og: { Damage = 90, RPM = 500, ClipSize = 10, SpreadHip = 0.01, SpreadIronSights = 0.0001, KickUp = 1, KickDown = 1, KickHorizontal = 1, }
    { SpreadHip = 0.1, },
    { Instructions = "You might want to scope in.", }
)
applyBasicPatch( "m9k_remington7615p",
    -- og: { Damage = 35, RPM = 50, ClipSize = 10, SpreadHip = 0.01, SpreadIronSights = 0.001, KickUp = 1, KickDown = 1, KickHorizontal = 1, }
    { Damage = 90, }
)
applyBasicPatch( "m9k_dragunov",
    -- og: { Damage = 90, RPM = 400, ClipSize = 10, SpreadHip = 0.01, SpreadIronSights = 0.00012, KickUp = 1, KickDown = 0.6, KickHorizontal = 0.5, }
    { Damage = 40, RPM = 400, },
    { Instructions = "Low damage, fast fire rate.\nGood for hip firing.", }
)
applyBasicPatch( "m9k_svt40",
    -- og: { Damage = 80, RPM = 350, ClipSize = 10, SpreadHip = 0.01, SpreadIronSights = 0.0001, KickUp = 1, KickDown = 1, KickHorizontal = 1, }
    { Damage = 40, RPM = 300, ClipSize = 12, SpreadHip = 0.005, },
    { Instructions = "Low damage, fast fire rate.\nGood for hip firing.\nSlightly slower than the SVD Dragonuv, but more accurate.", }
)

----- Submachine Guns -----
applyBasicPatch( "m9k_honeybadger",
    -- og: { Damage = 24, RPM = 791, ClipSize = 30, SpreadHip = 0.023, SpreadIronSights = 0.014, KickUp = 0.5, KickDown = 0.3, KickHorizontal = 0.5, }
    { Damage = 20, SpreadHip = 0.02, SpreadIronSights = 0.015, }
)
applyBasicPatch( "m9k_bizonp19",
    -- og: { Damage = 19, RPM = 675, ClipSize = 64, SpreadHip = 0.02, SpreadIronSights = 0.015, KickUp = 0.6, KickDown = 0.4, KickHorizontal = 0.5, }
    { Damage = 18, ClipSize = 40, }
)
applyBasicPatch( "m9k_smgp90",
    -- og: { Damage = 18, RPM = 900, ClipSize = 50, SpreadHip = 0.032, SpreadIronSights = 0.02, KickUp = 0.6, KickDown = 0.4, KickHorizontal = 0.5, }
    { Damage = 15, KickUp = 0.8, },
    { Scoped = true, }
    -- Scoped = true makes ADS not cut the recoil in half, without any other noticeable side effects.
)
applyBasicPatch( "m9k_mp5",
    -- og: { Damage = 22, RPM = 800, ClipSize = 30, SpreadHip = 0.023, SpreadIronSights = 0.013, KickUp = 0.1, KickDown = 0.1, KickHorizontal = 0.2, }
    { Damage = 18, SpreadHip = 0.04, SpreadIronSights = 0.03, },
    { Instructions = "Very low recoil.", }
)
applyBasicPatch( "m9k_mp7",
    -- og: { Damage = 24, RPM = 950, ClipSize = 30, SpreadHip = 0.023, SpreadIronSights = 0.014, KickUp = 0.5, KickDown = 0.4, KickHorizontal = 0.4, }
    { Damage = 16, KickUp = 0.4, KickDown = 0.4, KickHorizontal = 0.3, }
)
applyBasicPatch( "m9k_vector",
    -- og: { Damage = 18, RPM = 1000, ClipSize = 30, SpreadHip = 0.026, SpreadIronSights = 0.014, KickUp = 0.2, KickDown = 0.1, KickHorizontal = 0.3, }
    { Damage = 15, SpreadHip = 0.035, SpreadIronSights = 0.017, },
    { Instructions = "The scope is a must.", }
)
applyBasicPatch( "m9k_magpulpdr",
    -- og: { Damage = 30, RPM = 575, ClipSize = 30, SpreadHip = 0.03, SpreadIronSights = 0.02, KickUp = 0.3, KickDown = 0.3, KickHorizontal = 0.3, }
    { Damage = 20, }
)
applyBasicPatch( "m9k_mp40",
    -- og: { Damage = 25, RPM = 500, ClipSize = 32, SpreadHip = 0.022, SpreadIronSights = 0.015, KickUp = 0.3, KickDown = 0.2, KickHorizontal = 0.4, }
    { Damage = 18 }
)
applyBasicPatch( "m9k_mp5sd",
    -- og: { Damage = 30, RPM = 700, ClipSize = 30, SpreadHip = 0.025, SpreadIronSights = 0.015, KickUp = 0.2, KickDown = 0.3, KickHorizontal = 0.2, }
    { Damage = 15, ClipSize = 40, SpreadHip = 0.02, }
)
applyBasicPatch( "m9k_mp9",
    -- og: { Damage = 20, RPM = 900, ClipSize = 30, SpreadHip = 0.023, SpreadIronSights = 0.014, KickUp = 0.2, KickDown = 0.1, KickHorizontal = 0.2, }
    { Damage = 18, ClipSize = 20, }
)
applyBasicPatch( "m9k_tec9",
    -- og: { Damage = 17, RPM = 825, ClipSize = 32, SpreadHip = 0.029, SpreadIronSights = 0.019, KickUp = 0.2, KickDown = 0.3, KickHorizontal = 0.1, }
    { RPM = 2000, ClipSize = 40, SpreadHip = 0.02, SpreadIronSights = 0.075, KickUp = 1, KickHorizontal = 0.5, },
    { Instructions = "Fast, but at what cost?", }
    -- High ironsight spread since ADS reduces recoil (mini-tradeoff between recoil and spread at the player's discretion)
)
applyBasicPatch( "m9k_thompson",
    -- og: { Damage = 22, RPM = 575, ClipSize = 75, SpreadHip = 0.03, SpreadIronSights = 0.019, KickUp = 0.7, KickDown = 0.6, KickHorizontal = 0.65, }
    { SpreadHip = 0.03, SpreadIronSights = 0.025, KickUp = 0.8, KickDown = 0.6, KickHorizontal = 0.8, }
)
