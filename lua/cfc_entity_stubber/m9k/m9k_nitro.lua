AddCSLuaFile()

-- https://github.com/CFC-Servers/m9k_monorepo/blob/main/lua/weapons/m9k_nitro.lua
cfcEntityStubber.registerStub( function()
    local weapon = cfcEntityStubber.getWeapon( "m9k_nitro" )

    weapon.Primary.RPM = 20 -- 100
end )

-- https://github.com/CFC-Servers/m9k_monorepo/blob/main/lua/entities/m9k_nitro_vapor.lua
cfcEntityStubber.registerStub( function()
    local entTbl = scripted_ents.GetStored( "m9k_nitro_vapor" )
    if not entTbl then return end

    entTbl.ExplosionDamage = 600 -- 600
    entTbl.ExplosionRadius = 150 -- 200
    entTbl.PropDamageMultiplier = 1.3 -- 1
end )
