-- Change Citizen ID formatting and Weapon Serial Numbers
-- Dus hier werd door een gebruiker gevraagd dat ik een codefragment voor jullie post om te gebruiken om te wijzigen hoe wapenserienummers en burger -ID's worden geproduceerd, dit fragment kan letterlijk overal worden toegepast dat willekeurig gegenereerde strings bevat.
-- Voor Citizen ID's open qb-core/server/player.lua en zoek voor

function QBCore.Player.CreateCitizenId()

-- Kijk naar het gefotografeerde gedeelte en je merkt op dat de jouwe er anders uitziet, als je willekeurig gegenereerde nummers tot 6 willekeurig gegenereerde nummers wilt, gebruik dan 
Math.Random (111111, 999999) na de = sectie.

-- https://i.imgur.com/pInDCoS.png

-- Weapon Serials
-- Voor wapenseries heb ik de mijne die 3 willekeurige hoofdletters en 3 willekeurige getallen genereren, naar mijn mening is dit veel gemakkelijker om op de ogen te lezen, dit is echter een langdurige en vereist ook codemodificatie in de inventaris.

-- Codemodificatie voor QB-core
-- Voor QB Core Access hetzelfde bestand als de generatie van de burger -ID hierboven
-- qb-core/server/player.lua - Helemaal beneden
-- zoek voor

QBCore.Player.CreateSerialNumber()

-- Je zult opmerken dat het aanzienlijk langer zal zijn dan de mijne.
-- Opnieuw hieronder gefotografeerd is hoe de mijne er momenteel uitziet.
-- Als je het hetzelfde wilt als mijn ABC-123, kopieer dit fragment 

serialNumber = qbcore.shared.randomstr (3): upper () .. "-" .. qbcore.shared.randomint (3)

-- - https://i.imgur.com/9w2okkd.png

-- Inventory Modification

-- Zoek naar elke regel in de inventaris die Serie gebruikt in inventaris/server/main.lua, voor de of instructies plakken eenvoudig dezelfde code als hierboven om ABC-123 hetzelfde te gebruiken voor info.serie =
-- https://i.imgur.com/uycpCd0.png

-- https://i.imgur.com/NvqFEZc.png

-- En dat is het!U hebt zowel de QB-kernburger-ID's aangepast om 6 willekeurige getallen en de serienummers van het wapen te genereren om te genereren als ABC-123!



-- Citizenid maken om in cijfers te tellen
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