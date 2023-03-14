-- A Snippet for fueling job vehicles, the company is paying the fuel bill.
-- Add this in LegacyFuel/config.lua

Config.JobFuelPaidByCompany = {
    ['police'] = true,
    ['ambulance'] = true,
    ['mechanic'] = true,
}

-- Replace this the code in `LegacyFuel/source/fuel_server.lua`

RegisterNetEvent('fuel:pay', function(price)
    local Player = QBCore.Functions.GetPlayer(source)
    local amount = math.floor(price + 0.5)
    if not Player or price <= 0 then return end
    if Config.JobFuelPaidByCompany[Player.PlayerData.job.name] and Player.PlayerData.job.onduty then
        exports['qb-management']:RemoveMoney(Player.PlayerData.job.name, amount)
        TriggerClientEvent('QBCore:Notify', source, "Bill is paid by the "..Player.PlayerData.job.name.." company", "success")
    else
        Player.Functions.RemoveMoney('cash', amount)
    end
end)
