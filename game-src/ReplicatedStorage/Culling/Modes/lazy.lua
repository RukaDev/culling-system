
--[[

MapFolder
    Saved    
        - Close
        - Med
        - Far
    Map
        - Close
        - Med
        - Far


Example template file layout

close = {
    asset1 = {cf1, cf2, cf3},
    asset2 = {cf1, cf2, cf3}
}

]]



-- Explorer
local mapFolder = workspace.MapFolder
local assets = script.Parent.Assets


-- Data Files
local closeData = require(mapFolder.Saved.Close)
local medData = require(mapFolder.Saved.Medium)
local farData = require(mapFolder.Saved.Far)

-- Asset Files
local closeFolder = mapFolder.Map.Close
local medFolder = mapFolder.Map.Med
local farFolder = mapFolder.Map.Far


local function instantiate(range)
    for assetName, cfs in pairs(range) do
        local asset = assets[assetName]:Clone()
        asset.CFrame = cfs[i]
        asset.Parent = mapFolder
    end
end

local function save()
    local result = {}
    for _, rangeFolder in pairs(mapFolder:GetChildren()) do
        for _, asset in pairs(rangeFolder:GetChildren()) do
            if not result[asset.Name] then
                result[asset.Name] = {}
            end
            table.insert(result[asset.Name], asset.CFrame)
        end
    end

    -- Pass it to the repr to turn to string
end


-- Save
for _, rangeFolder in pairs({closeFolder, medFolder, farFolder}) do
    save(rangeFolder)
end

-- Load
for _, rangeData in pairs({closeData, medData, farData}) do
    instantiate(rangeData)
end