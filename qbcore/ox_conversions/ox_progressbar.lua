-- This is the progressbar


-- For this you need to change 
function QBCore.Functions.Progressbar


-- To

function QBCore.Functions.Progressbar(name, label, duration, useWhileDead, canCancel, disableControls, animation, prop, propTwo, onFinish, onCancel, icon)
    if GetResourceState('progressbar') ~= 'started' then error('progressbar needs to be started in order for QBCore.Functions.Progressbar to work') end
    disable = {
        move = disableControls.disableMovement,
        car = disableControls.disableCarMovement,
        mouse = disableControls.disableMouse,
        combat = disableControls.disableCombat,
    }

    anim = {
        dict = animation.animDict,
        clip = animation.anim,
        flag = animation.flags,
    }
    props = {
        model = prop.propOne,
        bone = prop.bone,
        pos = prop.coords,
        rot = prop.rotation,
    }
    if lib.progressBar({
        duration = duration,
        label = label,
        useWhileDead = useWhileDead,
        canCancel = canCancel,
        disable = disable,
        anim = anim,
        prop = props,
    }) then
        if onFinish then
            onFinish()
        end
    else
        if onCancel then
            onCancel()
        end
    end
end