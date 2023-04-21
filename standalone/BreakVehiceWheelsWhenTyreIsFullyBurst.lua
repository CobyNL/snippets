CreateThread(function()

    while true do
        Wait(1000)
        if IsPedInAnyVehicle(PlayerPedId(), false) then
            
           local vehicle = GetVehiclePedIsIn(PlayerPedId(),false)

           if IsVehicleTyreBurst(vehicle , 0, true) and GetVehicleWheelHealth(vehicle, 0) > 0.0 then

                BreakOffVehicleWheel(vehicle, 0, true, false, true, true)
                SetVehicleWheelHealth(vehicle, 0, 0.0)

           elseif IsVehicleTyreBurst(vehicle , 1, true) and GetVehicleWheelHealth(vehicle, 1) > 0.0 then

                BreakOffVehicleWheel(vehicle, 1, true, false, true, true)
                SetVehicleWheelHealth(vehicle, 1, 0.0)

           elseif IsVehicleTyreBurst(vehicle , 4, true) and GetVehicleWheelHealth(vehicle, 2) > 0.0 then

                BreakOffVehicleWheel(vehicle, 2, true, false, true, true)
                SetVehicleWheelHealth(vehicle, 2, 0.0)

           elseif IsVehicleTyreBurst(vehicle , 5, true) and GetVehicleWheelHealth(vehicle, 3) > 0.0 then

                BreakOffVehicleWheel(vehicle, 3, true, false, true, true)
                SetVehicleWheelHealth(vehicle, 3, 0.0)

           end

        end
    end
end )