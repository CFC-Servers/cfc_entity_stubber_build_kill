AddCSLuaFile()

-- https://github.com/CFC-Servers/m9k_monorepo/blob/main/lua/weapons/m9k_m29satan.lua
cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "m9k_m29satan" )

    -- Gambler's revolver. Low damage most of the time, small chance for a bunch of damage.

    weapon.Instructions = "The Gambler's Revolver."

    weapon.Primary.SpreadHip = 0
    weapon.Primary.SpreadIronSights = 0

    weapon.Primary.DamageDice = { -- Regular Primary.Damage stat is ignored.
        { Damage = 10, Weight = 100, },
        { Damage = 20, Weight = 70, },
        { Damage = 30, Weight = 50, },
        { Damage = 125, Weight = 12, BonusSound = "physics/glass/glass_impact_bullet4.wav", },
        { Damage = 1000, Weight = 1, BonusSound = "physics/glass/glass_largesheet_break1.wav", },
    }

    table.SortByMember( weapon.Primary.DamageDice, "Damage", false )

    function weapon:ShootBulletInformation()
        local owner = self:GetOwner()
        local currentCone

        if self:GetIronsightsActive() == true and owner:KeyDown( IN_ATTACK2 ) then
            currentCone = self.Primary.SpreadIronSights
        else
            currentCone = self.Primary.SpreadHip
        end

        local damageDice = self.Primary.DamageDice
        local totalWeight = 0

        for _, dice in ipairs( damageDice ) do
            totalWeight = totalWeight + dice.Weight
            dice._weightAccum = totalWeight
        end

        local seed = owner:GetCurrentCommand():CommandNumber()
        local damageRoll = util.SharedRandom( "cfc_entstubber_m9k_m29satan_damagedice", 0, totalWeight, seed )
        local diceChoice = damageDice[1]

        for _, dice in ipairs( damageDice ) do
            if damageRoll <= dice._weightAccum then
                diceChoice = dice

                break
            end
        end

        if diceChoice.BonusSound and diceChoice.BonusSound ~= "" then
            self:EmitSound( diceChoice.BonusSound )
        end

        self:ShootBullet( diceChoice.Damage, self.Primary.NumShots, currentCone )
    end
end )
