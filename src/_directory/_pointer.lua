local function splitPathIntoTable(path)
	local pathTable = {}
	for part in path:gmatch("[^/]+") do
		table.insert(pathTable, part)
	end
	return pathTable
end
local function getInstanceFromPath(path)
    local returnInstance = nil
	path = splitPathIntoTable(path)
	
	for _, instanceName in ipairs(path) do	
		returnInstance = if returnInstance then returnInstance:FindFirstChild(instanceName) else game:GetService(instanceName)
	end
	return returnInstance
end
return require(getInstanceFromPath(script:FindFirstChild("path").Value))