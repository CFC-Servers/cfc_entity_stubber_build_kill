AddCSLuaFile()

local IsValid = IsValid


cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "m9k_ithacam37" )

    weapon.Purpose = ""
    weapon.CFC_Category = "Shotgun:Bonk"

    weapon.Primary.RPM = 85
    weapon.Primary.ClipSize = 2
    weapon.Primary.KickUp = 14
    weapon.Primary.KickDown = 6
    weapon.Primary.KickHorizontal = 7
    weapon.Primary.NumShots = 12
    weapon.Primary.Damage = 2
    weapon.Primary.Spread = 0.1
    weapon.Primary.IronAccuracy = 0.09
    weapon.ShellTime = 0.65

    --[[
        - The following values can be added to any other hitscan weapon to enable bonking.
            - It will also need weapon.Primary.Damage and weapon.Primary.NumShots to be set.
        - If weapon.Bonk.AirShotsRefundAmmo is 1 or more, it will need weapon.Primary.ClipSize set and weapon.Bonk.ImpactEnabled to be true.
    --]]
    weapon.Bonk = weapon.Bonk or {}
    weapon.Bonk.Enabled = true -- Enables bonking. Other weapons can 
    weapon.Bonk.PlayerForce = 750 / 0.7 -- Soft-maximum launch strength for when all bullets hit, assuming no special hitgroups (e.g. only hit the chest)
        weapon.Bonk.PlayerForceAdd = 100 -- Flat addition to the launch strength, after the multiplier is applied
        weapon.Bonk.PlayerForceMultMax = 0.7 -- Damage mult (normal is 1) cannot exceed this value (otherwise could have massive launches from M9K damage spread, headshots, etc.)
        weapon.Bonk.PlayerForceComboMult = 1.75 -- Multiplies against force strength if the victim is currently in a bonk state
        weapon.Bonk.PlayerForceGroundZMult = 0.9 -- Makes ground launches be more vertical, proportionally
        weapon.Bonk.PlayerForceGroundZAdd = 0.3 -- Makes ground launches be more vertical, additively
        weapon.Bonk.PlayerForceGroundZMin = 250 -- Minimim z-component of launch force when on the ground. Gmod keeps players grounded unless the the z-vel is ~248.13 or above
        weapon.Bonk.PlayerForceAirMult = 1.15 -- Multiplies against force strength if the victim is in the air when hit
        weapon.Bonk.PlayerForceAirZMult = 1 -- Makes air launches be more vertical, proportionally
        weapon.Bonk.PlayerForceAirZAdd = 0.1 -- Makes air launches be more vertical, additively
        weapon.Bonk.PlayerForceCounteractMult = 0.8 -- How strongly (0-1) the victim's velocity will be counteracted by the launch, if they were moving opposite to it
        weapon.Bonk.PlayerForceIgnoreThreshold = 0.2 -- If the damage multiplier is below this, the player won't be launched
    weapon.Bonk.PlayerForceMultRagdoll = 300
    weapon.Bonk.PropForceMult = 15
    weapon.Bonk.AirShotsRefundAmmo = 0 -- Ammo refunded when shooting a midair, currently bonked target. Requires ImpactEnabled to be true.
    weapon.Bonk.ImpactEnabled = true -- If enabled, victims will take damage upon impacting a surface after getting bonked. This is also what enables tracking of the 'bonk status' of victims.
        weapon.Bonk.ImpactDamageMult = 12 / 20000
        weapon.Bonk.ImpactDamageMin = 5
        weapon.Bonk.ImpactDamageMax = 45

    -- These are not standard bonk settings, and are used only by this shotgun.
    weapon.Bonk.SelfForce = Vector( 300, 300, 420 ) -- Self-knockback when shooting while in the air
    weapon.Bonk.SelfDamage = 6 -- Damage dealt to self when shooting while in the air


    if CLIENT then return end

    weapon._ShootBullet = weapon._ShootBullet or weapon.ShootBullet or cfcEntityStubber.getWeapon( "bobs_gun_base" ).ShootBullet
    weapon.ShootBullet = function( self, damage, recoil, numBullets, spread )
        local ply = self:GetOwner()
        if not IsValid( ply ) or not ply:IsPlayer() then return end

        -- Self-knockback and self-damage when shooting while in the air
        if not ply:IsOnGround() then
            local dir = -ply:GetAimVector()
            ply:SetVelocity( dir * self.Bonk.SelfForce ) -- SetVelocity() when used on a player is additive

            local selfDamage = self.Bonk.SelfDamage
            if selfDamage > 0 then
                ply:TakeDamage( selfDamage, ply, self )
                ply:EmitSound( "physics/body/body_medium_impact_soft" .. math.random( 1, 7 ) .. ".wav", 85 )
            end
        end

        return self:_ShootBullet( damage, recoil, numBullets, spread )
    end
end )
