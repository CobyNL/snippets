-- player joining notify and loaded in

AddEventHandler('playerDropped', function(reason) 
    local src = source
    local name = GetPlayerName(src)
	local Players = QBCore.Functions.GetPlayers()
    local serverid = src
    local citizenid = QBCore.Functions.GetPlayer(src).PlayerData.citizenid

    for i=1, #Players, 1 do
  		if QBCore.Functions.HasPermission(Players[i], "god") or QBCore.Functions.HasPermission(Players[i], "admin") then
    		QBCore.Functions.Notify(Players[i], "Ontkoppelen: " .. GetPlayerName(src) .. " | " .. reason, "error", "4000")
            if reason == "exiting" then
                QBCore.Functions.Notify(Players[i], "Mogelijk gecombatlogd: " .. name .. "|" .. citizenid .. "ID: " .. serverid .. "|", "error", "4000")
                print ("[QBCore] Mogelijk gecombatlogd: " .. name .. "|" .. citizenid .. "ID: " .. serverid .. "|", "error", "4000")
            end
        end
	end
end)

AddEventHandler('playerConnecting', function(playerName, setKickReason, deferrals)
	local Players = QBCore.Functions.GetPlayers()
	local src = source
	
    for i=1, #Players, 1 do
  		if QBCore.Functions.HasPermission(Players[i], "god") or QBCore.Functions.HasPermission(Players[i], "admin") then
            local steam = GetPlayerName(src)
            if string.find(steam:lower(), "<script") then
                QBCore.Functions.Notify(Players[i], "Er probeerde iemand in te loggen met een script tag. Geblockt. Groetjes Coby.", "success", "4000")
            else
                QBCore.Functions.Notify(Players[i], "Aan het verbinden: " .. GetPlayerName(src), "success", "4000")
            end
		end
	end
end)

-- als een resource start dan verzend een notificatie naar de admins
AddEventHandler('onResourceStart', function(resource)
    local Players = QBCore.Functions.GetPlayers()
    for i=1, #Players, 1 do
  		if QBCore.Functions.HasPermission(Players[i], "god") or QBCore.Functions.HasPermission(Players[i], "admin") then
    		QBCore.Functions.Notify(Players[i], "Resource start: " .. resource, "success", "4000")
		end
	end
end)

-- als een resource stop dan verzend een notificatie naar de admins
AddEventHandler('onResourceStop', function(resource)
    local Players = QBCore.Functions.GetPlayers()
    for i=1, #Players, 1 do
  		if QBCore.Functions.HasPermission(Players[i], "god") or QBCore.Functions.HasPermission(Players[i], "admin") then
    		QBCore.Functions.Notify(Players[i], "Resource stop: " .. resource, "error", "4000")
		end
	end
end)

-- als een resource error dan verzend een notificatie naar de admins
AddEventHandler('onResourceError', function(resource, err)
    local Players = QBCore.Functions.GetPlayers()
    for i=1, #Players, 1 do
  		if QBCore.Functions.HasPermission(Players[i], "god") or QBCore.Functions.HasPermission(Players[i], "admin") then
    		QBCore.Functions.Notify(Players[i], "Resource error: " .. resource .. " error: " .. err, "error", "4000")
        end
    end
end)