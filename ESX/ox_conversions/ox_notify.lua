-- vervang het oude deel in functions.lua client naar deze

function ESX.ShowNotification(message, type, length)
    local position = Config.NotifyPosition
    if type == 'info' then type = 'inform' end
    if GetResourceState("ox_lib") ~= "missing" then
        return lib.notify({description = message, type = type, duration = length, position = position})
    elseif GetResourceState("esx_notify") ~= "missing" then
        return exports["esx_notify"]:Notify(type, length, message)
    end

    print("[^1ERROR^7] ^5Ox_lib^7 is niet gevonden of niet gestart voor es_extended!")
end

-- Zet deze in de Config van es_extended

Config.NotifyPosition = 'top-right'
