maybe someone can get use of this, it blocks weapon usage for 10 min after revive

local deathTimer = false
local currentMinute = 10
local minute = 60000


RegisterNetEvent("smirnoff_combattimeout:startTimer", function()
    deathTimer = true
    Citizen.CreateThread(function()
        while deathTimer do 
            TriggerEvent('ox_inventory:disarm')
            Wait(1000)
        end
    end)
    while currentMinute >= 0 do
        lib.hideTextUI()
        lib.showTextUI('You are not able to use your weapons for '..tostring(currentMinute).." min.", {
            position = "bottom-center",
            icon = 'ban',
            style = {
                borderRadius = 1,
                backgroundColor = '#FE9A2E',
                color = 'black'
            }
        })
        Wait(minute)
        currentMinute = currentMinute - 1
    end
    deathTimer = false
    TriggerEvent('ox_inventory:closeInventory')
    lib.hideTextUI()
    currentMinute = 10
end)

-- you need to trigger the event inside your revive event e.g. 'esx_ambulancejob:revive'