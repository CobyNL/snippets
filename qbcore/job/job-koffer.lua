-- Only a player with a job can open a job vehicle trunk.

-- - Go to qb-inventory/client.lua between line 700 and 800, you will find this below.
TriggerServerEvent("inventory:server:OpenInventory", "trunk", CurrentVehicle, other)
OpenTrunk()

-- - Change it with this below.
local canOpen = false
if vehicleClass == 18 then
    if PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' then
        canOpen = true
    end
else 
    canOpen = true
end
if canOpen then 
    TriggerServerEvent("inventory:server:OpenInventory", "trunk", CurrentVehicle, other)
    OpenTrunk()
else
    QBCore.Functions.Notify("You can't open this trunk!", "error", 5000)
end


-- - With this other players can't steel stuff from this job vehicle trunk and is't always locked.
-- - Its not locked for the player who has the job.