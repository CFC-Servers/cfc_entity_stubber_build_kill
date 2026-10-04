AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "m9k_intervention" )
    weapon.PrintName = "M200 Nightstalker"
    weapon.Secondary.UseMilDot = false
    weapon.Secondary.UseElcan = true
    weapon.Primary.IronAccuracy = .001
    weapon.Secondary.ScopeZoom = 12
    weapon.Instructions = "Equipped with a night vision scope."
    weapon.Primary.ClipSize = 7

     local wepEntry = list.GetEntry( "Weapon", "m9k_intervention" )
        if wepEntry then
        wepEntry.PrintName =  weapon.PrintName
        list.Set( "Weapon", "m9k_intervention", wepEntry )
     end
end )
--Cosmetic rework to an old CFC M9k version as a throwback for veteran players. Changes scope to green, and extends magazine.