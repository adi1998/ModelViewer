mod.TestArray = {"HoundMarker", "HoundMarkerCerb", "HoundMarkerColorMap"}

local pluginsData = rom.path.combine(rom.paths.plugins_data(), _PLUGIN.guid)
local rebuildCommand = "powershell \"" .. pluginsData .. "\\build.ps1\""
-- local rebuildCommand = "cd \"" .. pluginsData .. "\" & cd & pwsh build.ps1"

print(pluginsData)
print(rebuildCommand)

function mod.UpdateModel(model,grannytexture,pkg)
    local unit = mod.UnitData[model]
    local mesh = unit.GrannyModel
    local texture = grannytexture or unit.GrannyTexture
    local graphic = unit.Graphic
    local start = unit.StartGraphic
    local package = pkg or unit.Package
    if start == "" or start == "None" then
        start = nil
    end
    local move = unit.MoveGraphic
    if move == "" or move == "None" then
        move = nil
    end
    local stop = unit.StopGraphic
    if stop == "" or stop == "None" then
        stop = nil
    end
    
    local exc = {"BiomeHub","Fx","ScriptsBase", "", "None"}

    if not game.Contains(exc, mod.LastPackage) then
        print("unloading",mod.LastPackage)
        UnloadPackages({Name = mod.LastPackage})
    end
    if not game.Contains(exc, package) then
        print("loading", package)
        LoadPackages({Name = package})
        LoadPackages({Names = {"BiomeHub", "Fx", "ScriptsBase"}})
    end
    
    mod.LastPackage = unit.Package
    SetThingProperty({ Property = "GrannyModel", Value = mesh, DestinationId = CurrentRun.Hero.ObjectId })
    SetThingProperty({ Property = "Graphic", Value = graphic, DestinationId = CurrentRun.Hero.ObjectId })
    SetUnitProperty({ Property = "StartGraphic", Value = start, DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = move, DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = stop, DestinationId = CurrentRun.Hero.ObjectId })
    SetThingProperty({ Property = "GrannyTexture", Value = texture, DestinationId = CurrentRun.Hero.ObjectId })
    SetScale({ Id = CurrentRun.Hero.ObjectId, Fraction = 1.3 })
    if back then
        mod.index = mod.index - 1
    else
        mod.index = mod.index + 1
    end
    mod.index = (mod.index-1) % #mod.TestArray + 1
    print(mod.index)
end

-- game.OnControlPressed({'Gift', function()
-- 	return trigger_Gift()
-- end})


-- function trigger_Codex()
--     UnloadPackages({Name = "BiomeHub"})
--     local  unit = mod.UnitData[mod.TestArray[mod.index]]
--     local mesh = unit.GrannyModel
--     local texture = unit.GrannyTexture
--     local graphic = unit.Graphic
--     local start = unit.StartGraphic
--     SetThingProperty({ Property = "GrannyTexture", Value = texture, DestinationId = CurrentRun.Hero.ObjectId })
--     mod.index = mod.index + 1
--     mod.index = (mod.index-1) % #mod.TestArray + 1
-- end

-- game.OnControlPressed({'Use', function()
-- 	return trigger_Codex()
-- end})

function mod.UpdateLocalTexture()
    UnloadPackages({Name = _PLUGIN.guid .. "zerp-ModelViewer"})
    LoadPackages({Name = _PLUGIN.guid .. "zerp-ModelViewer"})
    SetThingProperty({ Property = "GrannyTexture", Value = "zerp-ModelViewer/custom", DestinationId = CurrentRun.Hero.ObjectId })
end

function mod.ReloadTexture()
    print("running", rebuildCommand)
    local handle = os.execute(rebuildCommand)

    -- local pipe = io.popen("powershell -command -", "w")
    -- pipe:write(rebuildCommand)
    -- pipe:close()
    mod.UpdateLocalTexture()
end