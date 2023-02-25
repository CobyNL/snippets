---Text box popup for player which dissappears after a set time.
---@deprecated in favor of QBCore.Functions.NotifyV2()
---@param text table|string text of the notification
---@param notifyType? NotificationType|DeprecatedNotificationType informs default styling. Defaults to 'inform'.
---@param duration? integer milliseconds notification will remain on scren. Defaults to 5000.
function QBCore.Functions.Notify(text, notifyType, duration)
    notifyType = notifyType or 'inform'
    if notifyType == 'primary' then notifyType = 'inform' end
    duration = duration or 5000
    local position = QBConfig.NotifyPosition
    if type(text) == "table" then
        local title = text.text or 'Placeholder'
        local description = text.caption or 'Placeholder'
        lib.notify({ title = title, description = description, duration = duration, type = notifyType, position = position})
    else
        lib.notify({ description = text, duration = duration, type = notifyType, position = position})
    -- else
    --     lib.defaultNotify({ description = text, duration = duration, type = notifyType, position = position, variant = variant})
    end
end