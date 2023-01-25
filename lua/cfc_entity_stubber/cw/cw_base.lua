AddCSLuaFile()

cfcEntityStubber.registerStub( "cw_base", function( weapon )
    -- https://github.com/Facepunch/garrysmod-issues/issues/5290 this issue makes some guns such as the cw rpg unusable on base branches
    -- So we just disable the spread sensitivity scaling
    weapon.HolsterOnLadder = false
    weapon.NearWallEnabled = false
    weapon.scaleSensitivityToSpread = false

    if CLIENT then
        weapon._AdjustMouseSensitivity = weapon._AdjustMouseSensitivity or weapon.AdjustMouseSensitivity

        weapon.AdjustMouseSensitivity = function( self, ... )
            self.OverallMouseSens = 1

            return weapon._AdjustMouseSensitivity( self, ... )
        end
    end
end )
