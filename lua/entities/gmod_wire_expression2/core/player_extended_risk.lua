E2Lib.RegisterExtension( "Player Extended Risk", false, "Adds in more (semi-abusable) commands to run on players. This is disabled by default; I highly recommend keeping this disabled unless you really trust your staff." )


e2function void entity:setWeaponColor(vector rgb) 
	if self.player:isAdmin() then
        
    else
        -- they can't run this function
    end
end
