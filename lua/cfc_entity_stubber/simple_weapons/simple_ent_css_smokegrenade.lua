-- https://github.com/TankNut/simple-weapons-css/blob/master/lua/entities/simple_ent_css_smokegrenade.lua
cfcEntityStubber.registerStub( function()
    local sent = scripted_ents.GetStored( "simple_ent_css_smokegrenade" )

    function sent:Explode()
        self:EmitSound( "BaseSmokeEffect.Sound" )

        local eff = EffectData()
        local filter = RecipientFilter()
        eff:SetOrigin( self:GetPos() )

        for _, ply in player.Iterator() do
            -- Only play for pvpers, or everyone if no pvp check exists.
            if not ply.IsInPvP or ply:IsInPvP() then
                filter:AddPlayer( ply )
            end
        end

        util.Effect( "simple_effect_css_smokegrenade", eff, true, filter )

        self:Remove()
    end
end )
