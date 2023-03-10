There is my own code for double connect checking and kick players. 
RegisterNetEvent('QBCore:CheckForDoubleConnect', function()
    -- print('Updating Player', hungerRate, thirstRate)
    -- print('START EVENT ON DOUBLE CONNECT')
    local src = source
    local tmpLicenseId = 0
    local players = GetPlayers()
    local license
    local identifiers = GetPlayerIdentifiers(src)
    for _, v in pairs(identifiers) do
        if string.find(v, 'license') then
            license = v
            break
        end
    end
    -- print('FIND LICENSE', license)
    for _, player in pairs(players) do
        local identifiers = GetPlayerIdentifiers(player)
        for _, id in pairs(identifiers) do
            if string.find(id, 'license') then
                -- print('FIND LICENSE FROM ALL P', id)
                if id == license then
                    -- print('IF MATCH', id)
                    tmpLicenseId +=1
                    -- print('ADDED TMP LICENSE', tmpLicenseId)
                    if tmpLicenseId > 1 then
                        -- print('MORE THEN 1 LIC', tmpLicenseId)
                        DropPlayer(src, 'TRYING TO DOUBLE CONNECT!')
                    end
                end
            end
        end
    end
end)

Paste this in qb-core->server->events.lua

CreateThread(function()
    while true do
        TriggerServerEvent('QBCore:CheckForDoubleConnect')
        Wait(5000)
    end
end)

qb-core->client->loops.lua
Set it on timer coz some cheaters can disable some server and client events like connect or something like that. 
0 false checking.