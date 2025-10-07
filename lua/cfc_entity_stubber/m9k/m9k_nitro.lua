AddCSLuaFile()

-- https://github.com/CFC-Servers/m9k_monorepo/blob/main/lua/weapons/m9k_nitro.lua
cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "m9k_nitro" )

    weapon.Primary.RPM = 20 -- 100

    -- Need to override some functions to make the nitro actually care about its RPM.

    function weapon:Throw()
        local owner = self:GetOwner()

        self:SetReloading( true ) -- Prevent players from manually reloading to skip the RPM cooldown
        self:SendWeaponAnim( ACT_VM_THROW )

        timer.Simple( 0.35, function()
            if not IsValid( self ) then return end
            if not IsValid( owner ) then return end

            owner:SetAnimation( PLAYER_ATTACK1 )

            local aim = owner:GetAimVector()
            local side = aim:Cross( Vector( 0, 0, 1 ) )
            local up = side:Cross( aim )
            local pos = owner:M9K_GetShootPos() + side * 5 + up * -1

            local grenade = ents.Create( self.Primary.Round )
            if not grenade:IsValid() then return end

            grenade._m9kOwner = owner
            grenade.DoNotDuplicate = true
            grenade:SetOwner( owner )
            grenade:SetAngles( aim:Angle() + Angle( 90, 0, 0 ) )
            grenade:SetPos( pos )
            grenade:Spawn()

            local phys = grenade:GetPhysicsObject()
            if owner:KeyDown( IN_ATTACK2 ) and phys:IsValid() then
                phys:ApplyForceCenter( owner:GetAimVector() * 2000 )
            else
                phys:ApplyForceCenter( owner:GetAimVector() * 5500 )
            end

            self:TakePrimaryAmmo( 1 )

            local timeUntilRPMDone = self:GetNextPrimaryFire() - CurTime()
            local reloadDelay = owner:GetViewModel():SequenceDuration( ACT_VM_RELOAD )

            timer.Simple( timeUntilRPMDone - reloadDelay, function()
                if not IsValid( self ) then return end
                if not IsValid( owner ) then return end

                if self:Clip1() == 0 and owner:GetAmmoCount( self:GetPrimaryAmmoType() ) == 0 then
                    owner:StripWeapon( self.Gun )
                elseif owner:GetActiveWeapon() == self then
                    self:DefaultReload( ACT_VM_DRAW )
                else
                    self:SetReloading( false )
                end
            end )
        end )
    end

    function weapon:Deploy()
        self:SetIronsights( false )
        self.DrawCrosshair = self.OrigCrossHair
        self:SetHoldType( self.HoldType )

        if not self:GetReloading() then
            if self:Clip1() == 0 then
                self:DefaultReload( ACT_VM_DRAW )
            else
                self:SendWeaponAnim( ACT_VM_DRAW )
            end

            if self.DeployDelay then
                self:SetNextPrimaryFire( CurTime() + self.DeployDelay )
            end
        end

        return true
    end

    function weapon:CanPrimaryAttack()
        if self:Clip1() <= 0 then return false end

        return true
    end
end )

-- https://github.com/CFC-Servers/m9k_monorepo/blob/main/lua/entities/m9k_nitro_vapor.lua
cfcEntityStubber.registerStub( function()
    local entTbl = scripted_ents.GetStored( "m9k_nitro_vapor" )
    if not entTbl then return end

    entTbl.ExplosionDamage = 600 -- 600
    entTbl.ExplosionRadius = 150 -- 200
    entTbl.PropDamageMultiplier = 1.3 -- 1
end )
