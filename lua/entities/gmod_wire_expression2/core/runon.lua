
E2Lib.RegisterExtension( "runOn Extended", true, "Allows players to have more runOn options, such as runOnPlayerSpawnProp(1)." )
--By March Cain
--(marchkarcz)
local propSpawnAlert = {}
local runByPropSpawn = 0
local propspawner = NULL
local propmodel = ""
local propentity = NULL

local npcSpawnAlert = {}
local runByNPCSpawn = 0
local npcspawner = NULL
local npcentity = NULL

local ragdollSpawnAlert = {}
local runByRagdollSpawn = 0
local ragdollspawner = NULL
local ragdollmodel = ""
local ragdollentity = NULL

local sentSpawnAlert = {}
local runBySENTSpawn = 0
local sentspawner = NULL
local sentmodel = ""

hook.Add("PlayerSpawnedProp","Exp2RunOnPropSpawn", function(ply, model, ent)
	propspawner = ply
	propmodelname = model
	propentity = ent
	for e,_ in pairs(propSpawnAlert) do
		if IsValid(e) then
			e.context.data.runByPropSpawn = true
			e:Execute()
			e.context.data.runByPropSpawn = nil
		else
			propSpawnAlert[e] = nil
		end
	end
end)

hook.Add("PlayerSpawnedNPC","Exp2RunOnNPCSpawn", function(ply, ent)
	npcspawner = ply
	npcentity = entity
	for e,_ in pairs(npcSpawnAlert) do
		if IsValid(e) then
			e.context.data.runByNPCSpawn = true
			e:Execute()
			e.context.data.runByNPCSpawn = nil
		else
			npcSpawnAlert[e] = nil
		end
	end
end)

hook.Add("PlayerSpawnedRagdoll","Exp2RunOnRagdollSpawn", function(ply, model, ent)
	ragdollspawner = ply
	ragdollmodelname = model
	ragdollentity = entity
	for e,_ in pairs(ragdollSpawnAlert) do
		if IsValid(e) then
			e.context.data.runByNPCSpawn = true
			e:Execute()
			e.context.data.runByNPCSpawn = nil
		else
			ragdollSpawnAlert[e] = nil
		end
	end
end)

hook.Add("PlayerSpawnedSENT","Exp2RunOnSENTSpawn", function(ply, class)
	sentspawner = ply
	sentmodelname = class
	for e,_ in pairs(sentSpawnAlert) do
		if IsValid(e) then
			e.context.data.runBySENTSpawn = true
			e:Execute()
			e.context.data.runBySENTSpawn = nil
		else
			sentSpawnAlert[e] = nil
		end
	end
end)


__e2setcost(15)
-- Prop
e2function void runOnPlayerSpawnProp(activate)
	if activate ~= 0 then
		propSpawnAlert[self.entity] = true
	else
		propSpawnAlert[self.entity] = nil
	end
end

e2function number playerSpawnPropClk()
	return self.data.runByPropSpawn and 1 or 0
end

e2function entity lastSpawnedPropSpawner()
	return propspawner
end
e2function string lastSpawnedPropModel()
	return propmodelname
end
e2function entity lastSpawnedPropEntity()
	return propentity
end

-- NPC
e2function void runOnPlayerSpawnNPC(activate)
	if activate ~= 0 then
		npcSpawnAlert[self.entity] = true
	else
		npcSpawnAlert[self.entity] = nil
	end
end

e2function number playerSpawnNPCClk()
	return self.data.runByNPCSpawn and 1 or 0
end

e2function entity lastSpawnedNPCSpawner()
	return npcspawner
end
e2function entity lastSpawnedNPCEntity()
	return npcentity
end


-- Ragdoll
e2function void runOnPlayerSpawnRagdoll(activate)
	if activate ~= 0 then
		ragdollSpawnAlert[self.entity] = true
	else
		propSpawnAlert[self.entity] = nil
	end
end

e2function number playerSpawnRagdollClk()
	return self.data.runByRagdollSpawn and 1 or 0
end

e2function entity lastSpawnedRagdollSpawner()
	return ragdollspawner
end
e2function string lastSpawnedRagdollModel()
	return ragdollmodelname
end
e2function entity lastSpawnedRagdollEntity()
	return ragdollentity
end

-- SENT
e2function void runOnPlayerSpawnSENT(activate)
	if activate ~= 0 then
		sentSpawnAlert[self.entity] = true
	else
		sentSpawnAlert[self.entity] = nil
	end
end

e2function number playerSpawnSENTClk()
	return self.data.runBySENTSpawn and 1 or 0
end

e2function entity lastSpawnedSENTSpawner()
	return sentspawner
end
e2function string lastSpawnedSENTClass()
	return sentmodelname
end