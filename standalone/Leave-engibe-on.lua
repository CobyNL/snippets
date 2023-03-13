-- leaves the vehicle engine on after leaving the vehicle

-- Dependency: ox_lib

-- throw it in any client resource 

local lastVehicle = nil

lib.onCache('vehicle', function(value)
    if value then
        lastVehicle = value
    else
        SetVehicleEngineOn(lastVehicle, true, true, true)
        lastVehicle = nil
    end
end)
