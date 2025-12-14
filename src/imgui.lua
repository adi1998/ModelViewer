rom.gui.add_imgui(function()
    if rom.ImGui.Begin("Model Selector") then
        drawMenu()
        rom.ImGui.End()
    end
end)

rom.gui.add_to_menu_bar(function()
    if rom.ImGui.BeginMenu("Configure Model") then
        drawMenu()
        rom.ImGui.EndMenu()
    end
end)

local previous = {
    current_model = nil,
    override = nil
}

function drawMenu()
    rom.ImGui.Text("Select Model")
    if rom.ImGui.BeginCombo("###model", mod.current_model) then
        for _, model in pairs(mod.EnemyArray) do
            if rom.ImGui.Selectable(model, (model == mod.current_model)) then
                if model ~= previous.current_model then
                    mod.current_model = model
                    previous.current_model = model
                    mod.UpdateModel(model)
                    if mod.override then
                        mod.UpdateLocalTexture()
                    end
                end
            end
            rom.ImGui.SetItemDefaultFocus()
        end
        rom.ImGui.EndCombo()
    end

    local value, checked = rom.ImGui.Checkbox("Override Model Texture", mod.override)
    if checked and value ~= previous.override then
        mod.override = value
        previous.override = value
        mod.UpdateModel(mod.current_model)
    end
    if value then
        local clicked = rom.ImGui.Button("Reload")
        if clicked or checked then
            mod.ReloadTexture()
        end
    end
end