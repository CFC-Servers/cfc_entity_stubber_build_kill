-- https://github.com/TankNut/simple-weapons-css/blob/master/lua/entities/simple_ent_css_smokegrenade.lua

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "simple_ent_css_smokegrenade" )

    weapon.Explode = function( self )
        self:EmitSound("BaseSmokeEffect.Sound")
    
        local effect = EffectData()
        effect:SetOrigin(self:GetPos())
    
        local filter = RecipientFilter()
        for _, ply in ipairs( player.GetAll() ) do
                if ply:IsInPvP() then filter:AddPlayer( ply ) end
            end
    
        util.Effect("simple_effect_css_smokegrenade", effect, true, filter)
    
        self:Remove()
    end
end )
