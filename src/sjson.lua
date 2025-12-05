local enemyUnitsFile = rom.path.combine(rom.paths.Content(), "Game\\Units\\Enemies.sjson")
local npcUnitsFile = rom.path.combine(rom.paths.Content(), "Game\\Units\\NPCs.sjson")
local playerUnitsFile = rom.path.combine(rom.paths.Content(), "Game\\Units\\PlayerUnits.sjson")

sjson.hook(enemyUnitsFile, function (data)
    for _, entry in ipairs(data) do
        if entry.Thing ~= nil then
            if entry.Thing.GrannyModel ~= nil and entry.Thing.Graphic ~= nil then
                mod.UnitData[entry.Name] = {
                    GrannyModel = entry.Thing.GrannyModel,
                    Graphic = entry.Thing.Graphic
                }
                table.insert(mod.EnemyArray,entry.Name)
            end
        end
    end
end)

sjson.hook(npcUnitsFile, function (data)
    for _, entry in ipairs(data) do
        if entry.Thing ~= nil then
            if entry.Thing.GrannyModel ~= nil and entry.Thing.Graphic ~= nil then
                mod.UnitData[entry.Name] = {
                    GrannyModel = entry.Thing.GrannyModel,
                    Graphic = entry.Thing.Graphic
                }
                table.insert(mod.EnemyArray,entry.Name)
            end
        end
    end
end)

sjson.hook(playerUnitsFile, function (data)
    for _, entry in ipairs(data) do
        if entry.Thing ~= nil then
            if entry.Thing.GrannyModel ~= nil and entry.Thing.Graphic ~= nil then
                mod.UnitData[entry.Name] = {
                    GrannyModel = entry.Thing.GrannyModel,
                    Graphic = entry.Thing.Graphic
                }
                table.insert(mod.EnemyArray,entry.Name)
            end
        end
    end
end)