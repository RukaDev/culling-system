local objects = {}

game["Run Service"].Heartbeat:Connect(function()
	for _, object in pairs(objects) do
		if os.clock() >= object.step then
			object.step = os.clock() + object.interval
			object.callback()
		end
	end
end)

local LoopUtil = {}

function LoopUtil.addHeartbeat(callback, interval, ...)
	local step = os.clock() + interval
	local obj = {
		interval = interval,
		step = step,
		callback = callback,
		params = ...
	}
	table.insert(objects, obj)
end

function LoopUtil.removeHeartbeat(callback)
	for i, object in pairs(objects) do
		if object.callback == callback then
			table.remove(objects, i)
		end
	end
end


return LoopUtil