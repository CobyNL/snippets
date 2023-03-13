-- vervang het oude deel in functions.lua client naar deze

function ESX.TextUI(message, type)
    local position = Config.TextUI
    if GetResourceState("ox_lib") ~= "missing" then
        return lib.showTextUI(message, {
            position = position
        })
    end

    print("[^1ERROR^7] ^5Ox_lib^7 is niet gevonden of niet gestart voor es_extended!")
end

function ESX.HideUI()
    if GetResourceState("ox_lib") ~= "missing" then
        return lib.hideTextUI()
    elseif GetResourceState("esx_textui") ~= "missing" then
        return exports["esx_textui"]:HideUI()
    end

    print("[^1ERROR^7] ^5Ox_lib^7 is niet gevonden of niet gestart voor es_extended!")
end

-- Zet deze in de Config van es_extended

Config.TextUI = 'left-center'
