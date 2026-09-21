AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "m9k_m98b" )

    weapon.PrintName = "M98 Recon"
    weapon.Secondary.ScopeZoom = 36
    weapon.Primary.IronAccuracy = .000001
    weapon.Secondary.UseMilDot = false
    weapon.Secondary.UseParabolic = true
end )
