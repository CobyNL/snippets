qb-vehiclekeys/client.lua

RegisterNetEvent('vehiclekeys:client:PoliceUnlock')
AddEventHandler('vehiclekeys:client:PoliceUnlock', function()
    local ped = PlayerPedId()
    local pedcoord = GetEntityCoords(ped)
    local vehicle = QBCore.Functions.GetClosestVehicle()
    local vehiclepos = GetEntityCoords(vehicle)
    local PlayerJob = QBCore.Functions.GetPlayerData().job
    
    if #(pedcoord - vehiclepos) < 2.0 then
        if (GetVehicleDoorLockStatus(vehicle) == 0) then QBCore.Functions.Notify("Vehicle Already Open", "primary") return end
        if (PlayerJob.name == 'police' and PlayerJob.onduty) then -- start unlock
            TriggerEvent('animations:client:EmoteCommandStart', {"picklock"})
            QBCore.Functions.Progressbar("policeunlock", "Unlocking vehicle !", 6000, false, true, {
                disableMovement = true,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = true,
            }, {}, {}, {}, function( ) -- finish
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                Wait(600)
                QBCore.Functions.Notify('Vehicle unlocked.', 'success')
                SetVehicleDoorsLocked(vehicle, 0)
                TriggerEvent('vehiclekeys:client:SetOwner', GetVehicleNumberPlateText(vehicle))
            end, function() -- cancel
                QBCore.Functions.Notify("Action cancelled", "error")
                TriggerEvent('animations:client:EmoteCommandStart', {"c"})
            end)
        elseif (not PlayerJob.name == 'police') then 
            QBCore.Functions.Notify("You're not a cop", "error")
        end
    else 
        QBCore.Functions.Notify("No vehicle found", "error")
    end
end)       


qb-radialmenu/config.lua/

{
    id = 'unlock',
    title = 'Unlock Vehicle',
    icon = 'user-lock',
    type = 'client',
    event = 'vehiclekeys:client:PoliceUnlock',
    shouldClose = true
   },









   RegisterNetEvent('vehiclekeys:client:PoliceUnlock')
   AddEventHandler('vehiclekeys:client:PoliceUnlock', function()
       local ped = PlayerPedId()
       local pedcoord = GetEntityCoords(ped)
       local vehicle = QBCore.Functions.GetClosestVehicle()
       local vehiclepos = GetEntityCoords(vehicle)
       local PlayerJob = QBCore.Functions.GetPlayerData().job
       
       if #(pedcoord - vehiclepos) < 2.0 then
           if (GetVehicleDoorLockStatus(vehicle) == 0) then QBCore.Functions.Notify("Vehicle Already Open", "primary") return end
           if (PlayerJob.name == 'police' and PlayerJob.onduty) then -- start unlock
               TriggerEvent('animations:client:EmoteCommandStart', {"picklock"})
               QBCore.Functions.Progressbar("policeunlock", "Unlocking vehicle !", 6000, false, true, {
                   disableMovement = true,
                   disableCarMovement = false 
                   disableMouse = false,
                   disableCombat = true,
               }, {}, {}, {}, function( ) -- finish
                   TriggerEvent('animations:client:EmoteCommandStart', {"c"})
                   Wait(600)
                   QBCore.Functions.Notify('Vehicle unlocked.', 'success')
                   TriggerServerEvent('qb-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(vehicle), 1)
                   TriggerEvent('vehiclekeys:client:SetOwner', GetVehicleNumberPlateText(vehicle))
               end, function() -- cancel
                   QBCore.Functions.Notify("Action cancelled", "error")
               end
           elseif (not PlayerJob.name == 'police') then 
               QBCore.Functions.Notify("You're not a cop", "error")
           end
       else 
           QBCore.Functions.Notify("No vehicle found", "error")
       end
   end)  
    
   I think you're misunderstanding how progressbars work. You need to actually check if the player is not a cop, is too far away, etc. Here is the improved code, haven't tested but in theory should work.
   Also fixed a lot of the linting
   Wooshie — 12-02-2023 07:49
   You're also anticipating that the client has network control to modify the vehicles locks. :)
   Zenith — 12-02-2023 08:08
   This is true, in fact this whole snippet needs to be re-written to communicate with the server and using the SetVehicleDoorsLocked native server sided
   Zenith — 12-02-2023 08:29
   Could just use this event 
   
   TriggerServerEvent('qb-vehiclekeys:server:setVehLockState', NetworkGetNetworkIdFromEntity(veh), 1)
   Just pass in veh, and trigger the event
   Updated the snippet
   !                         MamBa — 12-02-2023 16:48
   use , on disableCarMovement = false last