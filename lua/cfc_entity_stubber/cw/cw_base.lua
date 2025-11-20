AddCSLuaFile()
cfcEntityStubber.registerStub( function()
    -- https://github.com/Facepunch/garrysmod-issues/issues/5290 this issue makes some guns such as the cw rpg unusable on base branches
    -- So we just disable the spread sensitivity scaling
    local cwBase = cfcEntityStubber.getWeapon( "cw_base" )
    cwBase.HolsterOnLadder = false
    cwBase.NearWallEnabled = false
    cwBase.QuickScopeSpreadIncrease = 0
    cwBase.scaleSensitivityToSpread = false

    if CLIENT then
        cwBase._AdjustMouseSensitivity = cwBase._AdjustMouseSensitivity or cwBase.AdjustMouseSensitivity

        cwBase.AdjustMouseSensitivity = function( self, ... )
            self.OverallMouseSens = 1

            return cwBase._AdjustMouseSensitivity( self, ... )
        end
    end
end )
