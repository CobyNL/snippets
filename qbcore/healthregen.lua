Citizen.CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local maxHealth = GetEntityMaxHealth(ped)

        local health = GetEntityHealth(ped)
        Wait(1000)
        local newHealth = GetEntityHealth(ped)
        if newHealth < health then
            Wait(60000)
        else
            if health < maxHealth and health >= 100 and not InLaststand and not isDead then
                SetEntityHealth(ped, health + 1)
            end
        end
    end
end)