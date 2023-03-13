local QBCore = exports['qb-core']:GetCoreObject()

CreateThread(function()
    while true do
        Wait(100)
        local ped = PlayerPedId()
        if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
            local chance_result = math.random()
            --You can change the chance as you want! Just changed 0.2!
            if chance_result < 0.2 then 
                Wait(600)
                ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', 0.08)
                QBCore.Functions.Notify('Je bent te uitgeput!', 'error', 2500)
                SetPedToRagdoll(ped, 5000, 1, 2)
            else
                Wait(2000)
            end
        end
    end
end)

-- Degene die ik huidig gebruik

local NumberJump = 15

Citizen.CreateThread(function()
  local Jump = 0
  while true do

    Citizen.Wait(1)
    local ped = PlayerPedId()
    if IsPedOnFoot(ped) and not IsPedSwimming(ped) and (IsPedRunning(ped) or IsPedSprinting(ped)) and not IsPedClimbing(ped) and IsPedJumping(ped) and not IsPedRagdoll(ped) then
        Jump = Jump + 1
            if Jump == NumberJump then
                SetPedToRagdoll(ped, 5000, 1400, 2)
                Jump = 0
            end
        else 
            Citizen.Wait(500)
        end
    end
end)
