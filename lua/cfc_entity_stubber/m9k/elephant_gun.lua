AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "m9k_remington7615p" )
    weapon.PrintName = "Big Game Rifle"
    weapon.Secondary.ScopeZoom = 8
    weapon.Primary.Damage = 150
    weapon.Primary.SpreadHip = .5
    weapon.Primary.SpreadIronSights = .01
    weapon.Primary.KickUp = 18
    weapon.Primary.KickDown = 6
    weapon.Primary.KickHorizontal = 11
    weapon.Primary.ClipSize = 3
    weapon.Primary.RPM = 30
    weapon.Secondary.UseMilDot = false
    weapon.Secondary.UseAimpoint = true
    weapon.Instructions = "Fine tuned for hunting large animals, this weapon suffers greatly in accuracy."
    local wepEntry = list.GetEntry( "Weapon", "m9k_remington7615p" )
    if wepEntry then
        wepEntry.PrintName =  weapon.PrintName
        list.Set( "Weapon", "m9k_remington7615p", wepEntry )
        end
    end )
--Chosen for the high damage rework due to lack of use and overall poor performance compared to other sniper rifles.