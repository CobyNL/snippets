-- serverside

ESX = exports["es_extended"]:getSharedObject()

-- als een resource start dan verzend een notificatie naar de admins met esx

AddEventHandler('onResourceStart', function(resource)
    local Players = ESX.GetPlayers()
    for i=1, #Players, 1 do
        if ESX.GetPlayerFromId(Players[i]).group == 'admin' then
            TriggerClientEvent('esx:showNotification', Players[i], "Resource start: " .. resource, "success", "1000")
        end
    end
end)

-- als een resource stop dan verzend een notificatie naar de admins
AddEventHandler('onResourceStop', function(resource)
    local Players = ESX.GetPlayers()
    for i=1, #Players, 1 do
        if ESX.GetPlayerFromId(Players[i]).group == 'admin' then
            TriggerClientEvent('esx:showNotification', Players[i], "Resource stop: " .. resource, "error", "1000")
        end
    end
end)

-- als een resource error dan verzend een notificatie naar de admins
AddEventHandler('onResourceError', function(resource, err)
    local Players = ESX.GetPlayers()
    for i=1, #Players, 1 do
        if ESX.GetPlayerFromId(Players[i]).group == 'admin' then
            TriggerClientEvent('esx:showNotification', Players[i], "Resource error: " .. resource .. " | " .. err, "error", "1000")
        end
    end
end)