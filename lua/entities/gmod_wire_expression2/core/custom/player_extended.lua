__e2setcost(50)

E2Lib.RegisterExtension( "Player Extended", true, "Adds in more commands to run on players.")


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
        Damage:SetInflictor(this)
        Damage:SetDamageType(damageType)
		this:TakeDamageInfo(Damage)
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
