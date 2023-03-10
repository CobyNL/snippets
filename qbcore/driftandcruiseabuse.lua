If you find a lot of your players outrunning cops in suspicious ways or know about drift/cruise control abuse in standard qb-smallresources\client\cruise.lua , then go into the file and replace:

    if IsPedInAnyVehicle(ped, false) then
           if speed > 0 and GetVehicleCurrentGear(veh) > 0 then
               speed = GetEntitySpeed(veh)
               local TransformedSpeed = TransformToSpeed(speed) -- Comment me for mp/h
               TriggerEvent('seatbelt:client:ToggleCruise')
   
   
   with:
   
   if speed > 0 and GetVehicleCurrentGear(veh) > 0 then
           speed = GetEntitySpeed(veh)
           local TransformedSpeed = TransformToSpeed(speed) -- Comment me for mp/h
           local delay = math.random(1000, 5000) -- add a random delay between 1-5 seconds
           Wait(delay)
           TriggerEvent('seatbelt:client:ToggleCruise')
   
   
   
   This should (mostly) stop people from abusing cruise control to instantly gain traction when drifting around a corner. Aside from the obvious fix of totally just removing it from your server, this is a small band-aid to make it hard/unpredictable to abuse.
   
   Note, this doesn't stop Cruise control + engine off abuse, which I'm not skilled/experienced enough to deal with, but a small random delay on the input of cruise control should be enough to make it too unpredictable for people to use it for drift correction/abuse.
   
   Just change 1000 and 5000 to whatever delay window you want.
   
   Appreciate anyone adding something to stop engine off abuse! 