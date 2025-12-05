

function trigger_Gift(back)
    if mod.index == 1 then
        mod.LastPackage = ""
    end
    print(mod.EnemyArray[mod.index])
    local  unit = mod.UnitData[mod.EnemyArray[mod.index]]
    local mesh = unit.GrannyModel
    local graphic = unit.Graphic
    
    if not game.Contains({"BiomeHub","Fx","Scriptsbase", ""},mod.LastPackage) then
        print("unloading",mod.LastPackage)
        UnloadPackages({Name = mod.LastPackage})
    end
    if not game.Contains({"BiomeHub","Fx","Scriptsbase", ""},unit.Package) then
        print("loading", unit.Package)
        LoadPackages({Name = unit.Package})
    end
    
    mod.LastPackage = unit.Package
    SetThingProperty({ Property = "GrannyModel", Value = mesh, DestinationId = CurrentRun.Hero.ObjectId })
    SetThingProperty({ Property = "Graphic", Value = graphic, DestinationId = CurrentRun.Hero.ObjectId })
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

