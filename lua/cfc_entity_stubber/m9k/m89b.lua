AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "m9k_m98b" )

    weapon.PrintName = "M98 Recon"
    weapon.Instructions = "Equipped with a high-magnification scope for long-range engagements."
    weapon.Secondary.ScopeZoom = 36
    weapon.Primary.IronAccuracy = .000001
    weapon.Secondary.UseMilDot = false
    weapon.Secondary.UseParabolic = true
    local wepEntry = list.GetEntry( "Weapon", "m9k_m98b" )
    if wepEntry then
        wepEntry.PrintName =  weapon.PrintName
        list.Set( "Weapon", "m9k_m98b", wepEntry )
    end
end )
