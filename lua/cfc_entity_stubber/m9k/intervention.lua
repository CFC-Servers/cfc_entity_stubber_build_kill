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
end )
--Cosmetic rework to an old CFC M9k version as a throwback for veteran players. Changes scope to green, and extends magazine.