This snippet makes little changes to qb-smallresources to allow you to ignore weapons you want to enable crosshair for.

First we need to edit qb-smallresources > config.lua, find Config.Disable and replace whole thing with this:
Config.Disable = {
    ignoreWeapons = {"WEAPON_SNIPERRIFLE", "WEAPON_HEAVYSNIPER", "WEAPON_HEAVYSNIPER_MK2", "WEAPON_MARKSMANRIFLE", "WEAPON_MARKSMANRIFLE_MK2"},
    disableHudComponents = {1, 2, 3, 4, 7, 9, 13, 19, 20, 21, 22}, -- Hud Components: https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    disableControls = {37}, -- Controls: https://docs.fivem.net/docs/game-references/controls/
    displayAmmo = true -- false disables ammo display
}


Then we have to edit file hudcomponents.lua in qb-smallresources > client folder and then add this at start of the .lua script 
local ignoreWeapons = Config.Disable.ignoreWeapons
 and then replace CreateThread(function() thing with this one: 
RE3RY
OP
 — 13-01-2023 01:35
CreateThread(function()
    local isIgnored = false
    while true do

        local ped = GetPlayerPed(-1)
        -- Crosshair

        for i = 1, #ignoreWeapons do
            local currentWeaponHash = GetSelectedPedWeapon(ped)

            if currentWeaponHash == GetHashKey(ignoreWeapons[i]) then 
                isIgnored = true
            end

            if not isIgnored then
                HideHudComponentThisFrame(14)
            end
        end

        -- Hud Components

        for i = 1, #disableHudComponents do
            HideHudComponentThisFrame(disableHudComponents[i])
        end

        for i = 1, #disableControls do
            DisableControlAction(2, disableControls[i], true)
        end

        DisplayAmmoThisFrame(displayAmmo)
        
        -- Density

        SetParkedVehicleDensityMultiplierThisFrame(Config.Density['parked'])
        SetVehicleDensityMultiplierThisFrame(Config.Density['vehicle'])
        SetRandomVehicleDensityMultiplierThisFrame(Config.Density['multiplier'])
        SetPedDensityMultiplierThisFrame(Config.Density['peds'])
        SetScenarioPedDensityMultiplierThisFrame(Config.Density['scenario'], Config.Density['scenario']) -- Walking NPC Density
        Wait(0)
    end
end)
It should look like this if done correctly
Afbeelding
If you want to add more weapons just add name to config 😎 👍
RE3RY
OP
 — 13-01-2023 01:49
I forgot this...
Afbeelding
local ignoreWeapons = Config.Disable.ignoreWeapons
 
add it at the start of hudcomponents.lua
Sedres — 15-01-2023 11:52
For thos how still have the error watch carefuly the config maybe there are duplicated config.disable
that fixed my problem
Afbeelding
Lionh34rt — 28-01-2023 10:07
small tip
for your useable weapons list
use
ignoreWeapons = {
  `WEAPON_SNIPERRIFLE` = true,
  `WEAPON_HEAVYSNIPER` = true, 
  `WEAPON_HEAVYSNIPER_MK2` = true,
  `WEAPON_MARKSMANRIFLE` = true,
  `WEAPON_MARKSMANRIFLE_MK2` = true,
}

if ignoreWeapons[GetSelectedPedWeapon(ped)] then
  -- do what you want it to do
end
Nanorithm — 19-02-2023 03:48
not sure if this is a bug but pulling out an ignored weapon will bring the crosshair back, but swapping to a non-ignored weapon will still have the crosshair
Zoo | Dev on Benefits — 19-02-2023 07:18
GetPlayerPed(-1) :1970_pepe_sweat: we still in 2017
Nanorithm — 19-02-2023 07:34
fixed it with this:
-- config.lua
Config.Disable = {
    ignoreWeapons = {
        [`WEAPON_SNIPERRIFLE`] = true,
        [`WEAPON_HEAVYSNIPER`] = true,
        [`WEAPON_HEAVYSNIPER_MK2`] = true,
        [`WEAPON_MARKSMANRIFLE`] = true,
        [`WEAPON_MARKSMANRIFLE_MK2`] = true,
    },
    disableHudComponents = { 1, 2, 3, 4, 7, 9, 13, 19, 20, 21, 22 }, -- Hud Components: https://docs.fivem.net/natives/?_0x6806C51AD12B83B8
    disableControls = { 37 }, -- Controls: https://docs.fivem.net/docs/game-references/controls/
    displayAmmo = false -- false disables ammo display
}

-- hudcomponents.lua
local ignoreWeapons = Config.Disable.ignoreWeapons

CreateThread(function()
    local isIgnored = false
    while true do
        local ped = GetPlayerPed( -1)

        -- Crosshair
        if not ignoreWeapons[GetSelectedPedWeapon(ped)] then
            HideHudComponentThisFrame(14)
        end

        -- Hud Components
        for i = 1, #disableHudComponents do
            HideHudComponentThisFrame(disableHudComponents[i])
        end

        for i = 1, #disableControls do
            DisableControlAction(2, disableControls[i], true)
        end

        DisplayAmmoThisFrame(displayAmmo)

        -- Density
        SetParkedVehicleDensityMultiplierThisFrame(Config.Density['parked'])
        SetVehicleDensityMultiplierThisFrame(Config.Density['vehicle'])
        SetRandomVehicleDensityMultiplierThisFrame(Config.Density['multiplier'])
        SetPedDensityMultiplierThisFrame(Config.Density['peds'])
        SetScenarioPedDensityMultiplierThisFrame(Config.Density['scenario'], Config.Density['scenario']) -- Walking NPC Density
        Wait(0)
    end
end)