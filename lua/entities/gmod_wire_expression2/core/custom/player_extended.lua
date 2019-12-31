__e2setcost(50)

E2Lib.RegisterExtension( "Player Extended", true, "Adds in more commands to run on players.")
util.AddNetworkString("consolemessage")

e2function void entity:doDamage(number damage,number damageType)
	local isAdmin = false
	local propProtection = false
	if this:IsValid() then 
		if game.SinglePlayer() then isAdmin = true end
		if self.player:IsAdmin() then isAdmin = true end
		if !isAdmin then
			propProtection = ( this == self.player || E2Lib.isOwner(self, this) || E2Lib.isFriend( this, self.player) )
		end
	end	
	if (( isAdmin || propProtection ) && this:IsPlayer()) then
        local Damage = DamageInfo()
        Damage:SetDamage(damage)
        Damage:SetAttacker(self.player)
        Damage:SetDamageType(damageType)
		this:TakeDamageInfo(Damage)
        
        net.Start("consolemessage")
        net.WriteString(""+self.player:Name()+" did "+tostring(damage) + " on you!")
        net.Send(this)            
        if this:Health() <= 0 then
            this:Kill()
        end
    end
end

e2function void entity:slayPlayer()
	local isAdmin = false
	local propProtection = false
	if this:IsValid() then 
		if game.SinglePlayer() then isAdmin = true end
		if self.player:IsAdmin() then isAdmin = true end
		if !isAdmin then
			propProtection = ( this == self.player || E2Lib.isOwner(self, this) || E2Lib.isFriend( this, self.player) )
		end
	end	
	if (( isAdmin || propProtection ) && this:IsPlayer()) then
        this:Kill()
	end		
end


e2function void entity:setPlayerFOV(number fov, number time)
	local isAdmin = false
	local propProtection = false
	if this:IsValid() then 
		if game.SinglePlayer() then isAdmin = true end
		if self.player:IsAdmin() then isAdmin = true end
		if !isAdmin then
			propProtection = ( this == self.player || E2Lib.isOwner(self, this) || E2Lib.isFriend( this, self.player) )
		end
	end	
	if (( isAdmin || propProtection ) && this:IsPlayer()) then
        this:SetFOV(fov, time)
	end		
end

e2function void entity:setWalkSpeed(number speed)
	if(self.player:IsAdmin() && this:IsPlayer()) then
        this:SetWalkSpeed(speed)
    end
end
e2function void entity:setRunSpeed(number speed)
	if(self.player:IsAdmin() && this:IsPlayer()) then
        this:SetRunSpeed(speed)
    end
end
e2function void entity:setJumpPower(number power)
	if(self.player:IsAdmin() && this:IsPlayer()) then
        this:SetJumpPower(power)
    end
end