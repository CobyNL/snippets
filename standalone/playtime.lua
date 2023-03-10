-- Playtime

:cfxroad: How to get the playtime of a user without any shitty script?

Thanks to https://github.com/citizenfx/fivem/blob/98d2ec41a3c753b2e3ed565863169de8c2abb6d1/ext/cfx-ui/src/app/servers/components/reviews/server-reviews.component.ts#L85

You can easily make a request with your server code and the fivem identifier of the player you want to get his playtime as parameters.
For example, you can checkout https://lambda.fivem.net/api/ticket/playtimes/7b6bor?identifiers[]=fivem:10000 and you will get the playtime of the player.
note that the player must be logged into his account while playing for his playtime to be counted

Ofc, you can get the playtime of multiple players for example: https://lambda.fivem.net/api/ticket/playtimes/7b6bor?identifiers[]=fivem:1000&identifiers[]=fivem:1001

It might look like this:
local serverCode = "7b6bor" -- Variable just for the example but you should set the server code directly in the URL
RegisterNetEvent("PrintMyPlayTimeInConsole", function()
    local _source = source
    local fivemId = GetFivemId(GetPlayerIdentifiers(_source))
    if fivemId then
        PerformHttpRequest("https://lambda.fivem.net/api/ticket/playtimes/"..serverCode.."?identifiers[]="..fivemId, function(responseCode, resultData)
            if responseCode == 200 then
                resultData = json.decode(resultData)
                print(_source.." has a playtime of "..resultData[1].seconds.." seconds!")
            end
        end)
    else
        print("Can't find fivem id of ".._source)
    end
end)

function GetFivemId(userIds) -- Probably not the best way
    for i = 1, #userIds, 1 do
        if string.sub(userIds[i], 1, string.len("fivem:")) == "fivem:" then
            return userIds[i]
        end
    end
    return nil
end