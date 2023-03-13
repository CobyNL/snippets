-- Playtime

-- How to get the playtime of a user without any shitty script?

-- Thanks to https://github.com/citizenfx/fivem/blob/98d2ec41a3c753b2e3ed565863169de8c2abb6d1/ext/cfx-ui/src/app/servers/components/reviews/server-reviews.component.ts#L85

-- U kunt eenvoudig een verzoek indienen met uw servercode en de fivem -ID van de speler die u wilt om zijn speeltijd als parameters te krijgen.
-- U kunt bijvoorbeeld https://lambda.fivem.net/api/ticket/playtimes/7b6bor?identifiers[]=fivem:10000 en je krijgt de speeltijd van de speler.
-- Merk op dat de speler op zijn account moet worden ingelogd tijdens het spelen voor zijn speeltijd om te worden geteld

-- Ofc, je kunt bijvoorbeeld de speeltijd van meerdere spelers krijgen: https://lambda.fivem.net/api/ticket/playtimes/7b6bor?identifiers[]=fivem:1000&identifiers[]=fivem:1001

-- Het ziet er misschien zo uit:
local serverCode = "7b6bor" -- Variable Alleen voor het voorbeeld, maar u moet de servercode rechtstreeks in de URL instellen
RegisterNetEvent("PrintMyPlayTimeInConsole", function()
    local _source = source
    local fivemId = GetFivemId(GetPlayerIdentifiers(_source))
    if fivemId then
        PerformHttpRequest("https://lambda.fivem.net/api/ticket/playtimes/"..serverCode.."?identifiers[]="..fivemId, function(responseCode, resultData)
            if responseCode == 200 then
                resultData = json.decode(resultData)
                print(_source.." heeft een playtime van "..resultData[1].seconds.." seconden!")
            end
        end)
    else
        print("Can't find fivem id of ".._source)
    end
end)

function GetFivemId(userIds) -- Waarschijnlijk niet de beste manier
    for i = 1, #userIds, 1 do
        if string.sub(userIds[i], 1, string.len("fivem:")) == "fivem:" then
            return userIds[i]
        end
    end
    return nil
end