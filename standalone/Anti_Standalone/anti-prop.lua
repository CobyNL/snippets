RegisterCommand('propstuck', function()
    for k, v in pairs(GetGamePool('CObject')) do
        if IsEntityAttachedToEntity(PlayerPedId(), v) then
            SetEntityAsMissionEntity(v, true, true)
            DeleteObject(v)
            DeleteEntity(v)
        end
    end
end)

Citizen.CreateThread(function()
    while true do
            if IsPedInAnyVehicle(PlayerPedId(), false) then
            TriggerEvent("propstuck")
        end
        Wait(100)
    end
end)