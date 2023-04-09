-- Very easy Adaptive Card for qbcore's connect queue

-- qb-core/server/events.lua
-- Find OnPlayerConnecting(name, setKickReason, deferrals)
-- Go to the bottom of that function and replace:

        deferrals.done()
        Wait(1000)
        TriggerEvent('connectqueue:playerConnect', name, setKickReason, deferrals)

-- with

if QBConfig.AdaptiveCard.Enabled then
            local toEnd = false
            local count = 0
            while not toEnd do 
                deferrals.presentCard('{"type": "AdaptiveCard","$schema": "http://adaptivecards.io/schemas/adaptive-card.json","version": "1.3","body": [{"type": "Image","url": "' ..QBConfig.AdaptiveCard.Banner.. '","horizontalAlignment": "center"},{"type": "Container","items": [{"type": "TextBlock","text": "👋 Welcome '.. name ..' to '.. QBConfig.AdaptiveCard.Server_Name ..'! 👋","wrap": true,"fontType": "Default","size": "extralarge","weight": "bolder","color": "Light","horizontalAlignment": "center"},{"type": "TextBlock","text": "' ..QBConfig.AdaptiveCard.Heading.. '","wrap": true,"size": "Large","weight": "bolder","color": "Light","horizontalAlignment": "center"},{"type": "ColumnSet","height": "stretch","minHeight": "50px","bleed": true,"horizontalAlignment": "center","columns": [ { "type": "Column", "width": "stretch", "items": [ { "type": "ActionSet", "actions": [ { "type": "Action.OpenUrl", "title": "' .. QBConfig.AdaptiveCard.Button_1 .. '", "iconUrl": "' .. QBConfig.AdaptiveCard.Icon_1 .. '", "url": "' .. QBConfig.AdaptiveCard.Link_1 .. '", "style": "positive" } ], "horizontalAlignment": "center" } ], "height": "stretch" }, { "type": "Column", "width": "stretch", "items": [ { "type": "ActionSet", "actions": [ { "type": "Action.OpenUrl", "title": "' .. QBConfig.AdaptiveCard.Button_2 .. '", "style": "positive", "iconUrl": "' .. QBConfig.AdaptiveCard.Icon_2 .. '", "url": "' .. QBConfig.AdaptiveCard.Link_2 .. '" } ], "horizontalAlignment": "center" } ] } ] }, { "type": "ActionSet", "actions": [ { "type": "Action.OpenUrl", "title": "' .. QBConfig.AdaptiveCard.Button_3 .. '", "style": "destructive", "iconUrl": "' .. QBConfig.AdaptiveCard.Icon_3 .. '", "url": "' .. QBConfig.AdaptiveCard.Link_3 .. '" } ], "horizontalAlignment": "center" } ], "style": "default", "bleed": true, "height": "stretch" }, { "type": "Image", "url": "' .. QBConfig.AdaptiveCard.Icon_4 .. '", "selectAction": { "type": "Action.OpenUrl", "url": "' .. QBConfig.AdaptiveCard.Link_4 .. '" }, "horizontalAlignment": "center" } ] }',
                function(data, rawData)
                end)
                Wait((1000))
                count = count + 1;
                if count == QBConfig.AdaptiveCard.Wait then 
                    toEnd = true;
                end
            end
        end
        deferrals.done()
        Wait(1000)
        TriggerEvent('connectqueue:playerConnect', name, setKickReason, deferrals)


-- Then go to qb-core/config.lua and add:

QBConfig.AdaptiveCard = {
    Enabled = true,
    Server_Name = 'Free City RP 🚀',
    Wait = 12, -- How many seconds should splash page be shown for? (Max is 12)
    Banner = "https://i.imgur.com/GWFQdHN.jpg",
    Heading = "Make sure read the Rules and check out our Website!",
    ---------------- Rules
    Button_1 = 'Rules',
    Icon_1 = 'https://cdn3.emoji.gg/emojis/4446-peeporules.png',
    Link_1 = 'https://freecityrp.com/index.php/fivem-rules/',
    ---------------- Website
    Button_2 = 'Website',
    Icon_2 = 'https://cdn3.emoji.gg/emojis/6038-peepochat.gif',
    Link_2 = 'https://www.freecityrp.com/',
    ---------------- Discord
    Button_3 = 'Click to join Free City\'s Discord',
    Icon_3 = 'https://cdn3.emoji.gg/emojis/5628_pepe_saber.gif',
    Link_3 = 'https://www.discord.gg/freecityrp',
    ---------------- Bottom Banner
    Icon_4 = 'https://i.imgur.com/zz69ZSD.png',
    Link_4 = 'https://www.patreon.com/freecityrp',
}