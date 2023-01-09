local ModuleUtil = {}

function ModuleUtil.mapChildren(source) 
	local map = {}
	for _, module in pairs(source:GetChildren()) do
		map[module.Name] = require(module)
	end
	return map
end

function ModuleUtil.mapDescendants()

end

return ModuleUtil