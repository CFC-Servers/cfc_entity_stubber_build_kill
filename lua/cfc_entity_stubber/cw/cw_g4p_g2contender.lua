AddCSLuaFile()

cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "cw_g4p_g2contender" )
    weapon.Attachments = {}
    weapon.Recoil = 60
    weapon.Shots = 20
    weapon.AimSpread = 0.05
    weapon.HipSpread = 0.1
    weapon.SpreadPerShot = 0.01
    weapon.ClumpSpread = 0.1
    weapon.ReloadSpeed = 0.55
    weapon.Damage = 17

    local IsValid = IsValid

    hook.Add( "EntityTakeDamage", "CW_Stubber_BuffWhateverGunForce", function( ent, dmg )
        local attacker = dmg:GetAttacker()
        if not IsValid( attacker ) then return end
        if not attacker:IsPlayer() then return end

        local wep = attacker:GetActiveWeapon()
        if not IsValid( wep ) then return end

        if wep:GetClass() ~= "cw_g4p_g2contender" then return end

        if IsValid( ent ) and ent:IsPlayer() then
            dmg:SetDamageForce( dmg:GetDamageForce() * 100 )
        else
            dmg:SetDamageForce( dmg:GetDamageForce() * 100 )
        end
    end )
end )
