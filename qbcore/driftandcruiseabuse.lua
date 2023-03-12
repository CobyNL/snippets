-- Als je veel van je spelers op verdachte manieren vindt of op de hoogte is van misbruik van drift/cruise control in standaard QB-SmallResources \ client \ cruise.lua, ga dan naar het bestand en vervang dan:
    if IsPedInAnyVehicle(ped, false) then
           if speed > 0 and GetVehicleCurrentGear(veh) > 0 then
               speed = GetEntitySpeed(veh)
               local TransformedSpeed = TransformToSpeed(speed) -- Comment me voor MP/H
               TriggerEvent('seatbelt:client:ToggleCruise')
   
   
--    met:
   
   if speed > 0 and GetVehicleCurrentGear(veh) > 0 then
           speed = GetEntitySpeed(veh)
           local TransformedSpeed = TransformToSpeed(speed) -- comment me voor MP/H
           local delay = math.random(1000, 5000) -- Voeg een willekeurige vertraging toe tussen 1-5 seconden
           Wait(delay)
           TriggerEvent('seatbelt:client:ToggleCruise')
   
   
   
--    Dit zou (meestal) moeten voorkomen dat mensen cruise control misbruiken om onmiddellijk grip te krijgen wanneer ze om een hoek drijven.Afgezien van de voor de hand liggende oplossing om het volledig van je server te verwijderen, is dit een kleine pleister om het moeilijk/onvoorspelbaar te maken voor misbruik.
   
--    Let op, dit stopt Cruise Control + Engine niet van misbruik, die niet bekwaam/ervaren genoeg ben om mee om te gaan, maar een kleine willekeurige vertraging op de input van cruise control moet voldoende zijn om het te onvoorspelbaar te maken voor mensen om te gebruikenhet voor driftcorrectie/misbruik.
   
--    Wijzig gewoon 1000 en 5000 in welke vertraging u maar wilt.
   
--    Waardeer iedereen die iets toevoegt om de motor van misbruik te stoppen!