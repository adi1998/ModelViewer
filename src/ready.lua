game.OnControlPressed({'Gift', function()
	return trigger_Gift()
end})

mod.index = 1

function trigger_Gift()
    local  unit = mod.UnitData[mod.EnemyArray[mod.index]]
    local mesh = unit.GrannyModel
    local graphic = unit.Graphic
    SetThingProperty({ Property = "GrannyModel", Value = mesh, DestinationId = CurrentRun.Hero.ObjectId })
    SetThingProperty({ Property = "Graphic", Value = graphic, DestinationId = CurrentRun.Hero.ObjectId })
    SetThingProperty({ Property = "GrannyTexture", Value = "", DestinationId = CurrentRun.Hero.ObjectId })
    index = index + 1
    index = (index-1) % #mod.EnemyArray + 1
end