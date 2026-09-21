AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "m9k_contender" )
    weapon.PrintName = "G2 Contender Big Game"
    weapon.Secondary.ScopeZoom = 8
    weapon.Primary.Damage = 200
    weapon.Primary.SpreadHip = .5
    weapon.Primary.SpreadIronSights = .01
    weapon.Primary.KickUp = 18
    weapon.Primary.KickDown = 6
    weapon.Primary.KickHorizontal = 11
    weapon.Primary.RPM = 7   
    weapon.Secondary.UseMilDot = false
    weapon.Secondary.UseAimpoint = true
    weapon.Instructions = "Fine tuned for damage, this weapon suffers greatly in accuracy.""
end )
--Chosen for the high damage rework due to lack of use and overall poor performance compared to other sniper rifles.