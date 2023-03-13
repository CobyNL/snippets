-- Serverside script

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