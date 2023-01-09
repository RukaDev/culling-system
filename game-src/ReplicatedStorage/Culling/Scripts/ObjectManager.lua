
-- Util
local ModuleUtil = require(script.Parent.Parent.Util.Module)

local objectModules = ModuleUtil.mapChildren(game.Workspace.Map.Styles)

local ObjectManager = {}

function ObjectManager.getIndex(folderName, name, regionName)
	for index, regions in pairs(objectModules[folderName]) do
		if regions[regionName].name == name then
			return index
		end
	end
end

function ObjectManager.getName(index, folderName, regionName)
	return objectModules[folderName][index][regionName].name
end


return ObjectManager