-- Zoals reeds in de titel beschreven, heb ik een klein fragment voor u waarmee u de uptime van uw server in de serverbrowser kunt weergeven

-- Voorbeeld:
-- Maak een nieuw bestand onder QB-SmallResources> Server genaamd Uptime.lua
local start = os.time()

CreateThread(function()
    while true do
        Wait(1000 * 60)

        local uptime = os.difftime(os.time(), start)
        local hrs = math.floor(uptime / 3600)
        local mins = math.floor((uptime - (hrs * 3600)) / 60)

        local uptimeString = ""
        if hrs > 0 then
            uptimeString = string.format("%d:%02d", hrs, mins)
        else
            uptimeString = string.format("%d minutes", mins)
        end

        SetConvarServerInfo('Uptime', uptimeString)
    end
end)