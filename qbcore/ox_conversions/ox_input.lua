-- qb-input install:



-- Now go to your fxmanifest file in qb-input resource and add: 
shared_scripts {
    '@ox_lib/init.lua'
}


-- Make a shared_scripts if you don't have it!

-- Now change the client.lua with this (remember to copy from the file under and don't drag and drop it) 
------------------------------------------------------------------------------------------------------------------------
-- local function ShowInput(data)
--     Wait(150)
--     if not data then return end
--     if properties then return end

--     properties = promise.new()

--     SetNuiFocus(true, true)
--     SendNUIMessage({
--         action = "OPEN_MENU",
--         data = data
--     })

--     return Citizen.Await(properties)
-- end

local function convertToOx(data)
    local name = data.header
    local oxData = {}
    local names = {}
    local required = {}
    local nextLabel = nil
    for k, v in ipairs(data.inputs) do
        if v.isRequired then
            required[k] = true
        end
        if v.type == 'text' then
            oxData[#oxData + 1] = {
                type = 'input',
                placeholder = v.text,
                default = v.default,
                label = nextLabel,
            }
            names[#oxData] = v.name
            if nextLabel then nextLabel = nil end
        elseif v.type == 'number' then
            oxData[#oxData + 1] = {
                type = 'number',
                placeholder = v.text,
                default = v.default,
                label = nextLabel,
            }
            names[#oxData] = v.name
            if nextLabel then nextLabel = nil end
        elseif v.type == 'password' then
            oxData[#oxData + 1] = {
                type = 'input',
                placeholder = v.text,
                icon = 'lock',
                password = true,
                label = nextLabel,
            }
            names[#oxData] = v.name
            if nextLabel then nextLabel = nil end
        elseif v.type == 'radio' then
            oxData[#oxData + 1] = {
                type = 'select',
                label = v.text,
            }
            for _, option in ipairs(v.options) do
                oxData[#oxData].options = oxData[#oxData].options or {}
                oxData[#oxData].options[#oxData[#oxData].options + 1] = {
                    label = option.text,
                    value = option.value,
                }
            end
            names[#oxData] = v.name
            if nextLabel then nextLabel = nil end
        elseif v.type == 'checkbox' then
            if #v.options == 1 then
                oxData[#oxData + 1] = {
                    type = 'checkbox',
                    label = v.text,
                    default = v.default,
                    checked = v.options[1].checked
                }
                names[k] = v.options[1].value
                if nextLabel then nextLabel = nil end
            elseif #v.options == 0 then
                -- I would sometimes do this to make a subheader - Mkeefeus
                nextLabel = v.text
            else
                -- fallback to qb-input
                return ShowInput(data, true)
            end
        elseif v.type == 'select' then
            oxData[#oxData + 1] = {
                type = 'select',
                label = v.text,
            }
            for _, option in ipairs(v.options) do
                oxData[#oxData].options = oxData[#oxData].options or {}
                oxData[#oxData].options[#oxData[#oxData].options + 1] = {
                    label = option.text,
                    value = option.value,
                }
            end
            names[#oxData] = v.name
            if nextLabel then nextLabel = nil end
        end
    end
    local selections = lib.inputDialog(name, oxData)
    if not selections then return end
    local returnData = {}
    for k, v in pairs(selections) do
        if required[k] and (not v or v == '') then
            QBCore.Functions.Notify('You must fill out all required fields', 'error')
            return ShowInput(data)
        end
        returnData[names[k]] = tostring(v)
    end
    return next(returnData) and returnData or nil
end

exports("ShowInput", convertToOx)
--exports("ShowInput", ShowInput)
