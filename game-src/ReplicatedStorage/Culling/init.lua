
--[[

Changes:
	- Create close, med, far folders and run command to store positions + asset in template file
	- Use culling system's method with each model having close, med, and far

]]

-- Services
local RunService = game:GetService("RunService")

-- Modules
local Positions = require(game.Workspace.Map.Data.Templates)

-- Settings
local Config = require(script.Scripts.Config)
local Caps = require(script.Scripts.Caps)


-- Util
local ModuleUtil = require(script.Util.Module)
local CharacterUtil = require(script.Util.Character)
local LoopUtil = require(script.Util.Loop)

-- Dependencies
local OctreeModule = require(script.Dependencies.Octree)
local PartCache = require(script.Dependencies.PartCache)

-- Explorer
local assets = script.Assets

-- Extra
local octree
local culled = {}
local character
local currentRegion = "region1"
local caches = {}
local terrains = {}


-- Range Functions
local function getRange(dist)
	if dist < Config.CLOSE_RANGE then 
		return "Close"
	elseif dist < Config.MEDIUM_RANGE then 
		return "Medium"
	elseif dist < Config.FAR_RANGE then 
		return "Far"
	end
end

local function removeRange(info, range)
	if info[range] and info[range].cache then
		for _, object in pairs(info[range].cache) do
			if caches[object.Name] then
				caches[object.Name]:ReturnPart(object)
			end
		end
	end
	info.instance[range]:ClearAllChildren()
end


local function addRange(position, info, range)
	local folder = info.instance[range]
	local cacheParts = {}
	
	for _, objectCategory in pairs(Config.OBJECT_RANGES[range]) do
		local idx = table.find(Config.OBJECT_ORDER, objectCategory)
		if info.template[idx] ~= 0 then
			local modInfo = terrains[objectCategory][info.template[idx]]
			for name, offsetTable in pairs(modInfo) do 
				for _, offset in pairs(offsetTable) do
					local function positionPart(part)
						if part:IsA("Model") then
							part:PivotTo(CFrame.new(position) * offset)
						else
							part.CFrame = CFrame.new(position) * offset 
						end
					end
					
					local part
					if caches[name] then
						part = caches[name]:GetPart()
						if not part then continue end
						table.insert(cacheParts, part)
					else
						part = assets[name]:Clone()
						part.Parent = folder
					end
					positionPart(part)
				end 
			end
		end
	end
	
	if #cacheParts > 0 then
		info[range] = {
			cache = cacheParts
		}
	end
end

local function addAllRanges(culledPositions, pos)
	for position, info in pairs(culledPositions) do 
		local dist = (pos - position).Magnitude
		local range = getRange(dist) 
		
		if range then
			for i = Config.RANGE_ENUMS[range], 3 do
				addRange(position, info, Config.RANGES[i])
			end
		end
		info.range = range
	end
end


-- Cull Functions
local function cullOut(pos, info)
	info.instance:Destroy()
	info = nil
	culled[pos] = nil
end

local function cullIn(position)
	local obj = Positions[position]

	local ground = assets[obj.ground]:Clone()
	ground.Position = position 
	ground.Name = obj.ground

	for _, range in pairs(Config.RANGES) do 
		local f = Instance.new("Folder")
		f.Name = range 
		f.Parent = ground 
	end

	ground.Parent = game.Workspace.Map.Assets.Container

	return {
		instance = ground,
		template = obj.template
	}
end


-- Checks
local function broadCheck(pos, range)
	pos = pos or character.PrimaryPart.Position
	range = range or Config.BROAD_RANGE
	
	local candidates = octree:SearchRadiusHashTable(pos, range)

	for position, _ in pairs(candidates) do
		if not culled[position] then
			culled[position] = cullIn(position)
		end
	end

	for position, info in pairs(culled) do
		if not candidates[position] then
			cullOut(position, info)
		end
	end
end

local function narrowCheck()
	for position, info in pairs(culled) do 
		local dist = (character.PrimaryPart.Position - position).Magnitude
		local newRange = getRange(dist) 
		local oldRange = info.range

		if newRange ~= oldRange then 
			if newRange and oldRange then
				if Config.RANGE_ENUMS[newRange] > Config.RANGE_ENUMS[oldRange] then 
					removeRange(info, info.range)	
				else
					addRange(position, info, newRange)
				end
			else
				if oldRange and not newRange then -- if we leave range
					removeRange(info, info.range)
				else -- newrange and not oldrange
					addRange(position, info, newRange)
				end
			end

			info.range = newRange 
		end
	end
end





-- Helper
local function mapRegionCache()
	for name, amnt in pairs(Caps[currentRegion]) do
		local mesh = assets[name]
		caches[name] = PartCache.new(mesh, amnt, game.Workspace.Map.Assets.Cached)
	end
end


-- API
local CullingController = {}

function CullingController.Teleport(pos)
	broadCheck(character.PrimaryPart.Position, Config.BROAD_RANGE)
	addAllRanges(culled, pos)
end

function CullingController.Start()
	mapRegionCache()
	terrains = ModuleUtil.mapChildren(game.Workspace.Map.Data.Templates)
	character = CharacterUtil.getCharacter()
	octree = OctreeModule.new()

	for position, _ in pairs(Positions) do 
		octree:CreateNode(position)
	end

	CullingController.Teleport(character.PrimaryPart.Position)
	LoopUtil.addHeartbeat(narrowCheck, Config.NARROW_INTERVAL)
	LoopUtil.addHeartbeat(broadCheck, Config.BROAD_INTERVAL)
end

function CullingController.Stop()
	LoopUtil.removeHeartbeat(narrowCheck)
	LoopUtil.removeHeartbeat(broadCheck)
	octree:ClearAllNodes()

	for position, info in pairs(culled) do
		cullOut(position, info)
	end
	
	-- Reset global
	caches = {}
	terrains = {}
	culled = {}
	octree = nil
end

return CullingController




