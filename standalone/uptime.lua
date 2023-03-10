As already described in the title, I have a small snippet for you with which you can display the uptime of your server in the server browser

Example: 
Create a new file under qb-smallresources > server called uptime.lua 
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