hands up utilising statebag and then the qtarget export to go alongside for searching a player.
    local dict = "missminuteman_1ig_2"
    RegisterKeyMapping('+handsup', 'Hands Up', 'keyboard', 'X')
    
    RegisterCommand('+handsup', function()
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(100)
        end
        TaskPlayAnim(PlayerPedId(), dict, "handsup_enter", 4.0, 4.0, -1, 50, 0, false, false, false)
        handsUp = true
        LocalPlayer.state:set('handsup', true, true)
    end, false)
    
    RegisterCommand('-handsup', function()
        handsUp = false
        LocalPlayer.state:set('handsup', false, true)
        StopAnimTask(PlayerPedId(), dict, "handsup_enter", 2.0)
    end, false)
    
    
    exports['qtarget']:Player({
        options = {
            {
                icon = "fas fa-id-card",
                label = "search",
                action = function(entity)
                    local targetId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                    exports.ox_inventory:openInventory('player', targetId)
                end,
                canInteract = function(entity)
                        local targetId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
                        return (Player(targetId).state.handsup)
                end
            }
        },
        distance = 3.0
    })