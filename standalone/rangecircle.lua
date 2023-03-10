A simple snippet with which you can add a voice circle for pma-voice and set a color for the individual ranges

Preview: https://streamable.com/gt1gth

Example: 
Create a new file under pma-voice > client > utils called rangeCircle.lua 
local color = {
    {171, 250, 75}, -- 1.5
    {250, 221, 75}, -- 3.0
    {250, 75, 75} -- 6.0
}
local alpha = 150
local delayTime = 750

AddEventHandler('pma-voice:setTalkingMode', function(mode)
    local distance = Cfg.voiceModes[mode][1]

    DrawVoiceDistanceMarker(distance, color[mode], alpha)
    TriggerEvent('QBCore:Notify', string.format("New Range: %s", distance .. 'm'), 'success')
end)


function DrawVoiceDistanceMarker(distance, color, alpha)
    local r, g, b = color[1], color[2], color[3]
    local pedCoords = GetEntityCoords(PlayerPedId())

    for i = alpha, 0, -5 do
      local a = math.floor((i * alpha) / 150)
        DrawMarker(25, pedCoords.x, pedCoords.y, pedCoords.z - 0.825, 0, 0, 0, 0, 0, 0, distance, distance, 0.25, r, g, b, a, false, true, 2, nil, nil, false)
        Citizen.Wait(delayTime / alpha)
    end
end