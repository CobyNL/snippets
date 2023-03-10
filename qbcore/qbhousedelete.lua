Server Side
RegisterNetEvent('qb-houses:server:RemoveHouse', function(ClosestHouse)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)

    Config.Houses[ClosestHouse] = nil

        TriggerClientEvent("qb-houses:client:setHouseConfig", -1, Config.Houses)

    TriggerClientEvent('qb-house:client:RefreshHouseTargets', -1)

    MySQL.Async.execute('DELETE FROM player_houses WHERE house = @house',{['@house'] = ClosestHouse})

    MySQL.Async.execute('DELETE FROM houselocations WHERE name = @name',{['@name'] = ClosestHouse})
end)


Client Side
In function showEntranceHeaderMenu add this

 if QBCore.Functions.GetPlayerData().job and QBCore.Functions.GetPlayerData().job.name == 'realestate' then
        headerMenu[#headerMenu+1] = {
            header = 'Delete House',
            params = {
                event = "qb-houses:client:DeleteHouse",
                args = {}
            }
        }    
    end

Also in Client Side add this where you want

RegisterNetEvent('qb-houses:client:DeleteHouse', function()
    if ClosestHouse ~= nil then
        TriggerServerEvent('qb-houses:server:RemoveHouse', ClosestHouse)
    end
end)





IF you only want this to happen for houselocations that are not owned
 if QBCore.Functions.GetPlayerData().job and QBCore.Functions.GetPlayerData().job.name == 'realestate' and not isOwned then
        headerMenu[#headerMenu+1] = {
            header = 'Delete House',
            params = {
                event = "qb-houses:client:DeleteHouse",
                args = {}
            }
        }    
    end
 
otherwise realtors will be yeeting people's houses by accident

RegisterNetEvent('qb-houses:server:RemoveHouse', function(ClosestHouse)
    local src = source
    local pData = QBCore.Functions.GetPlayer(src)

    Config.Houses[ClosestHouse] = nil

        TriggerClientEvent("qb-houses:client:setHouseConfig", -1, Config.Houses)

    TriggerClientEvent('qb-house:client:RefreshHouseTargets', -1)

    MySQL.Async.execute('DELETE FROM houselocations WHERE name = @name',{['@name'] = ClosestHouse})
end)
