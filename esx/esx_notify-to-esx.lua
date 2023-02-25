function ESX.ShowNotification(message, type, length)
    local position = Config.NotifyPosition
    if type == 'info' then type = 'inform' end
    if GetResourceState("ox_lib") ~= "missing" then
        return lib.notify({description = message, type = type, duration = length, position = position})
    elseif GetResourceState("esx_notify") ~= "missing" then
        return exports["esx_notify"]:Notify(type, length, message)
    end

    print("[^1ERROR^7] ^5ESX Ox_lib^7 is niet gevonden of niet gestart voor es_extended!")
end
    
    
function ESX.TextUI(message, type)
    local position = Config.TextUI
    if GetResourceState("ox_lib") ~= "missing" then
        return lib.showTextUI(message, {
            position = position
        })
    end

    print("[^1ERROR^7] ^5ESX Ox_lib^7 is niet gevonden of niet gestart voor es_extended!")
end

function ESX.HideUI()
    if GetResourceState("ox_lib") ~= "missing" then
        return lib.hideTextUI()
    elseif GetResourceState("esx_textui") ~= "missing" then
        return exports["esx_textui"]:HideUI()
    end

    print("[^1ERROR^7] ^5ESX TextUI^7 is Missing!")
end

-- Config

Config.NotifyPosition = 'top-right'
Config.TextUI = 'left-center'