-- Map Animation --
local inMenuMode = false
local emote = false
local renewedWeaponCarry = true -- If using Renewed-WeaponsCarry
CreateThread(function()
    while true do
        Wait(500)
        if IsPauseMenuActive() then
            inMenuMode = true
            if not emote and inMenuMode then
                exports.scully_emotemenu:PlayByCommand('map2')
                emote = true
            end
        else
            inMenuMode = false
            if emote and not inMenuMode then
                exports.scully_emotemenu:CancelAnimation()
                emote = false
                for k, v in pairs(GetGamePool('CObject')) do
                    if IsEntityAttachedToEntity(PlayerPedId(), v) then
                        SetEntityAsMissionEntity(v, true, true)
                        DeleteObject(v)
                        DeleteEntity(v)
                    end
                end
                -- if renewedWeaponCarry then exports["Renewed-Weaponscarry"]:refreshProps() end
            end
        end
    end
end)