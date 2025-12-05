

function trigger_Gift(back)
    if mod.index == 1 then
        mod.LastPackage = ""
    end
    print(mod.EnemyArray[mod.index])
    local  unit = mod.UnitData[mod.EnemyArray[mod.index]]
    local mesh = unit.GrannyModel
    local graphic = unit.Graphic
    local start = unit.StartGraphic
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
    if not game.Contains(exc, unit.Package) then
        print("loading", unit.Package)
        LoadPackages({Name = unit.Package})
    end
    
    mod.LastPackage = unit.Package
    SetThingProperty({ Property = "GrannyModel", Value = mesh, DestinationId = CurrentRun.Hero.ObjectId })
    SetThingProperty({ Property = "Graphic", Value = graphic, DestinationId = CurrentRun.Hero.ObjectId })
    SetUnitProperty({ Property = "StartGraphic", Value = start, DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "MoveGraphic", Value = move, DestinationId = CurrentRun.Hero.ObjectId })
	SetUnitProperty({ Property = "StopGraphic", Value = stop, DestinationId = CurrentRun.Hero.ObjectId })
    SetThingProperty({ Property = "GrannyTexture", Value = "", DestinationId = CurrentRun.Hero.ObjectId })

    if back then
        mod.index = mod.index - 1
    else
        mod.index = mod.index + 1
    end
    mod.index = (mod.index-1) % #mod.EnemyArray + 1
end

game.OnControlPressed({'Gift', function()
	return trigger_Gift()
end})

game.OnControlPressed({'Inventory', function()
	return trigger_Gift(true)
end})

