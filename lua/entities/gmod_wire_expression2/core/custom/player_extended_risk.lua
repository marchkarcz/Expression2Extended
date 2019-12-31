E2Lib.RegisterExtension( "Player Extended Risk", false, "Adds in more (semi-abusable) commands to run on players.", "This is disabled by default; I highly recommend keeping this disabled unless you really trust your staff." )

//Note: this functionality will only work for admins.
e2function void entity:kickPlayer(string reason)
	if(self.player:IsAdmin() && this:IsPlayer()) then
        this:Kick(reason)
    end
end

e2function void entity:banPlayer(number length)
	if(self.player:IsAdmin() && this:IsPlayer()) then
        this:Ban(length,true)
    end
end