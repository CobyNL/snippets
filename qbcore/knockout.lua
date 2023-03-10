Made some changes to it and added a progressbar wasnt able to stop being able to open phone but rest looks good
also commented out the black screen & notifications but you can make other changes for yourselves
integrated disabling pistol whip uncomment if you want to use it


local QBCore = exports['qb-core']:GetCoreObject()
local knockedOut = false
local wait = 15
local count = 60

-- Stops Pistol Whipping Functions
--[[
Citizen.CreateThread(function()
    while true do
        Wait(1000) 
        if (not IsPedArmed(PlayerPedId(), 1)) and (GetSelectedPedWeapon(PlayerPedId()) ~= GetHashKey('weapon_unarmed')) then
    
            DisableControlAction(0, 140, true) 
            DisableControlAction(0, 141, true) 
            DisableControlAction(0, 142, true) 
        
        end
    end
end)
]]--




CreateThread(function()
    while true do
        Wait(1000)
        local myPed = PlayerPedId()
        PlayerData = QBCore.Functions.GetPlayerData(source)
        if IsPedInMeleeCombat(myPed) and not (PlayerData.metadata["inlaststand"] or PlayerData.metadata["isdead"]) then
            if GetEntityHealth(myPed) < 150  then
                SetPlayerInvincible(PlayerId(), true)
                SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
                --QBCore.Functions.Notify('You were knocked out!', 'error', 7500)
                wait = 15
                knockedOut = true
                
                QBCore.Functions.Progressbar("knocked-out", "Knocked Out", 5000, false, false, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true
                },
                {},
                {},
                {},
                function()
                    -- Done
                    knockedOut = false
                    --QBCore.Functions.Notify("Finally you're awake!", "success", 5000)
                end,
                function()
                end,
                "fa-solid fa-face-dizzy")   
            end
        end
        if knockedOut then
            SetPlayerInvincible(PlayerId(), true)
            DisablePlayerFiring(PlayerId(), true)
            SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
            ResetPedRagdollTimer(myPed)
            --DoScreenFadeOut(100)

            if wait >= 0 then
                count = count - 1
                if count == 0 then
                    count = 60
                    wait = wait - 1
                    SetEntityHealth(myPed, GetEntityHealth(myPed)+2)
                end
            else
                --DoScreenFadeIn(100)
                SetPlayerInvincible(PlayerId(), false)
                knockedOut = false
            end
        end
    end
end)