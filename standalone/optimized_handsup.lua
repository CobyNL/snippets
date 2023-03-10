Optimized Crouching , Hands up , finger point
local handsUp = false
RegisterKeyMapping('handsup', 'Hands up', 'keyboard', 'x')
RegisterCommand('handsup', function()

    if IsPedInAnyVehicle(cache.ped, false) then
        return
    end
    if not handsUp then
        ClearPedSecondaryTask(cache.ped)
        ClearPedTasks(cache.ped)

        if mp_pointing then mp_pointing = false end

        RequestAnimDict("missminuteman_1ig_2")
        while not HasAnimDictLoaded("missminuteman_1ig_2") do
            Wait(100)
        end

        handsUp = true
        TaskPlayAnim(cache.ped, "missminuteman_1ig_2", "handsup_base", 2.0, 2.0, -1, 51, 0, false, false, false)

        while handsUp do
            Wait(1000)
            if not IsEntityPlayingAnim(cache.ped, "missminuteman_1ig_2", "handsup_base", 3) then
                handsUp = false
            end
        end
    else
        handsUp = false
        ClearPedSecondaryTask(cache.ped)
    end
end)

Crouching 
local crouched = false
RegisterKeyMapping('Crouch', 'Crouch', 'keyboard', 'LCONTROL')
RegisterCommand("Crouch", function()

    if IsPedInAnyVehicle(cache.ped, false) then
        return
    end
  
    RequestAnimSet("move_ped_crouched")
    while ( not HasAnimSetLoaded("move_ped_crouched")) do 
        Citizen.Wait(100)
    end 

    if not crouched then
        crouched = true
        SetPedMovementClipset(cache.ped, "move_ped_crouched", 0.85)
    else
        crouched = false
        ResetPedMovementClipset(cache.ped, 0)
    end
end)

Finger point 
https://pastebin.com/aq62w2GR