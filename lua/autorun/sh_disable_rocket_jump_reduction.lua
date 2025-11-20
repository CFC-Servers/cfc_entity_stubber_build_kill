hook.Add( "EasyRocketJumps_ScaleDamage", "DisableNitroReduction", function( _ent, dmginfo )
    if dmginfo:GetInflictor():GetClass() == "m9k_nitro_vapor" then
        return 1
    end
end )


