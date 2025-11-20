AddCSLuaFile()

-- Since a bunch of weapons are getting very little edits I'm going to use a helper function here
local function applyBasicPatch( class, range, accuracy )
    cfcEntityStubber.registerStub( function()
        local weapon = cfcEntityStubber.getWeapon( class )

        if range then
            weapon.Primary.Range = range
        end

        if accuracy then
            weapon.Primary.Accuracy = accuracy
        end
    end )
end

applyBasicPatch( "simple_hl2_357", 2000, 8 )
applyBasicPatch( "simple_hl2_ar2", 1600 )
applyBasicPatch( "simple_hl2_pistol", 1200 )
-- applyBasicPatch( "simple_hl2_shotgun" )
applyBasicPatch( "simple_hl2_smg1", 600 )

applyBasicPatch( "simple_hl2e_arp", 1200 )

applyBasicPatch( "simple_css_ak47", 2000 )
applyBasicPatch( "simple_css_aug", 3400, 8 )
applyBasicPatch( "simple_css_awp", 8000, 8 )
applyBasicPatch( "simple_css_deagle", 2000, 8 )
applyBasicPatch( "simple_css_elite", 1400 )
applyBasicPatch( "simple_css_famas", 2000 )
-- applyBasicPatch( "simple_css_fiveseven" )
applyBasicPatch( "simple_css_g3sg1", 6000, 8 )
applyBasicPatch( "simple_css_galil", 2000 )
applyBasicPatch( "simple_css_glock", 1500 )
-- applyBasicPatch( "simple_css_m3" )
applyBasicPatch( "simple_css_m4a1", 2400 )
applyBasicPatch( "simple_css_m249", 1400 )
applyBasicPatch( "simple_css_mac10", 1000 )
applyBasicPatch( "simple_css_mp5", 1200 )
applyBasicPatch( "simple_css_p90", 1000 )
applyBasicPatch( "simple_css_p228", 2400 )
applyBasicPatch( "simple_css_scout", 8000, 8 )
applyBasicPatch( "simple_css_sg550", 6000, 8 )
applyBasicPatch( "simple_css_sg552", 3200, 8 )
applyBasicPatch( "simple_css_tmp", 1200 )
applyBasicPatch( "simple_css_ump", 1800 )
applyBasicPatch( "simple_css_usp", 2800 )
-- applyBasicPatch( "simple_css_xm1014" )
