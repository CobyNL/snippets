This modification allows you to only spawn at the last location, no menu to choose a location will pop up.

qb-multicharacter/html/index.html#325
Replace line with this one:
axios.post('https://qb-multicharacter/spawnLastLocation', {


qb-multicharacter/client/main.lua
Add:
RegisterNUICallback('spawnLastLocation', function(data, cb)
    DoScreenFadeOut(10)
    local cData = data.cData
    SetEntityAsMissionEntity(charPed, true, true)
    DeleteEntity(charPed)
    TriggerServerEvent('qb-multicharacter:server:spawnLastLocation', cData)

    SetNuiFocus(false, false)
    skyCam(false)

    cb("ok")
end)

RegisterNetEvent('qb-multicharacter:client:spawnLastLocation', function(coords)
    local ped = PlayerPedId()
    SetEntityCoords(ped, coords.x, coords.y, coords.z)
    SetEntityHeading(ped, coords.w)
    FreezeEntityPosition(ped, false)
    SetEntityVisible(ped, true)
    TriggerServerEvent('QBCore:Server:OnPlayerLoaded')
    TriggerEvent('QBCore:Client:OnPlayerLoaded')
    DoScreenFadeIn(250)
end)



qb-multicharacter/server/main.lua
Add:
RegisterNetEvent('qb-multicharacter:server:spawnLastLocation', function(cData)
    local src = source
    if QBCore.Player.Login(src, cData.citizenid) then
        repeat
            Wait(10)
        until hasDonePreloading[src]
        print('^2[qb-core]^7 '..GetPlayerName(src)..' (Citizen ID: '..cData.citizenid..') has succesfully loaded!')
        QBCore.Commands.Refresh(src)
        loadHouseData(src)
        local coords = json.decode(cData.position)
        TriggerClientEvent('qb-multicharacter:client:spawnLastLocation', src, coords)
    end
end)