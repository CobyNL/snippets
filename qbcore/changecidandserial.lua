Change Citizen ID formatting and Weapon Serial Numbers
Paru
OP
 — 27-02-2023 22:01
So it was requested by a user here that I post a code snippet for you guys to use to change how weapon serial numbers and citizen ID's are produced, this snippet can be applied literally anywhere that contains randomly generated strings.

For Citizen ID's open qb-core/server/player.lua and search for 
function QBCore.Player.CreateCitizenId()

look at the photographed section and you'll note yours will look different, if you want randomly generated numbers up to 6 randomly generated numbers then use math.random(111111, 999999) after the = section.

https://i.imgur.com/pInDCoS.png

Weapon Serials
For weapon serials I have mine generate 3 random uppercase letters and 3 random numbers, in my opinion this is much easier to read on the eyes, this is a lengthy one though and requires code modification in the inventory as well.

Code Modification for QB-Core
For QB Core access the same file as the Citizen ID generation above
qb-core/server/player.lua - At the very bottom

Search for 
QBCore.Player.CreateSerialNumber()

You'll note it'll be considerably longer than mine.
Again photographed below is what mine currently looks like.
If you want it the same as mine ABC-123 then copy this snippet SerialNumber = QBCore.Shared.RandomStr(3):upper() .. "-" .. QBCore.Shared.RandomInt(3)

https://i.imgur.com/9w2OkKD.png

Inventory Modification

Search for every single line in the inventory that uses serie in inventory/server/main.lua, for the or statements simply paste the same code as above to use ABC-123  same for info.serie =

https://i.imgur.com/uycpCd0.png

https://i.imgur.com/NvqFEZc.png

And that's it! You've modified both the QB Core Citizen ID's to generate 6 random numbers and the Weapon serial numbers to generate as ABC-123!







-- Making CitizenID to count in numbers 
local CitizenId = 0 
function QBCore.Player.CreateCitizenId()
    local UniqueFound = false
    while not UniqueFound do
        CitizenId = CitizenId + 1
        local result = MySQL.prepare.await('SELECT COUNT(*) as count FROM players WHERE citizenid = ?', { CitizenId }) -- 1, 2, 3, 4
        if result == 0 then
            UniqueFound = true
        end
    end
    return CitizenId
end