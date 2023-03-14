To create an outfit menu on the trunks of emergency vehicles for police / leo, do the following.

    Open qb-policejob\client\job.lua
    Search for : if Config.UseTarget then
    Add the next code after that line :
    
    local bones = {'boot'}
    exports['qb-target']:AddTargetBone(bones, {
        options = {
            {num = 1, type = "client", icon = 'fas fa-shirt', label = 'Outfits',
            action = function()
                TriggerEvent("illenium-appearance:client:openOutfitMenu", PlayerJob.name)
            end,
            canInteract = function(entity)
                local vehclass = GetVehicleClass(GetEntityModel(entity))
                if vehclass ~= 18 and (PlayerJob.name ~= "police" or PlayerJob.type ~= "leo") then return end
                return true
            end,
            }
        },
        distance = 1.0,
    })
    
    https://i.imgur.com/V9GW4s9.png
    
    This snippet will check if the targeted vehicle is an emergency class and if you have the job police (backward compatibility) or job type leo.
    This way all the LEO personnel can use trunk outfits only on emergency vehicles.
    
    I have not tested it but it should work.