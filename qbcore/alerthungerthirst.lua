CreateThread(function()
    while true do 
        Wait(120000)
        local PlayerData = QBCore.Functions.GetPlayerData()
        if PlayerData.metadata["hunger"] <= 30 and PlayerData.metadata["hunger"] ~= 0 then
            QBCore.Functions.Notify('Je hebt honger..', 'error', 4000)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 7.0, "honger", 0.4)
        end
    end
end)

CreateThread(function()
    while true do 
        Wait(120000)
        local PlayerData = QBCore.Functions.GetPlayerData()
        if PlayerData.metadata["thirst"] <= 30 and PlayerData.metadata["thirst"] ~= 0 then
            QBCore.Functions.Notify('Je hebt dorst..', 'error', 4000)
            TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 7.0, "dorst", 0.4)
        end
    end
end)