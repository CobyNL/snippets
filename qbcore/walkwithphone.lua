Add the True/False option to walk while using a default phone

add to config.lua
Config.AllowWalking = true

inside the [qb]\qb-phone\config.lua find 
PhoneData.isOpen = true

And change it to this
            PhoneData.isOpen = true
            if Config.AllowWalking then
            SetNuiFocusKeepInput(true)
            CreateThread(function()
                while PhoneData.isOpen do
                    DisableDisplayControlActions()
                    Wait(1)
                end
            end)
        end


Under the  NUI Callbacks add this two
RegisterNUICallback('DissalowMoving', function()
    if not Config.AllowWalking then return end
    SetNuiFocusKeepInput(false)
end)

RegisterNUICallback('AllowMoving', function()
    if not Config.AllowWalking then return end
    SetNuiFocusKeepInput(true)
end)



Then inside the [qb]\qb-phone\html\js\phone.js paste at line 10
$( "input[type=text], textarea, input[type=number]" ).focusin(function(e) {
    e.preventDefault();
    $.post('https://qb-phone/DissalowMoving');
});

$( "input[type=text], textarea, input[type=number]" ).focusout(function(e) {
    e.preventDefault();
    $.post('https://qb-phone/AllowMoving');
});


And inside the [qb]\qb-phone\html\js\whatsapp.js paste at line 10
$( "input[type=text], textarea, input[type=number]" ).focusin(function(e) {
    e.preventDefault();
    $.post('https://qb-phone/DissalowMoving');
});
$(".whatsapp-openedchat").focusin(function(e) {
    e.preventDefault();
    $.post('https://qb-phone/DissalowMoving');
});

$( "input[type=text], textarea, input[type=number]" ).focusout(function(e) {
    e.preventDefault();
    $.post('https://qb-phone/AllowMoving');
});
 
GoldO — 24-02-2023 20:02
Thanks, i need to test this, i was about to make the same thing. I'll let you know if i find some bugs or improvements.
GoldO — 25-02-2023 10:43
I'll try to fix the issue with your character looking in the direction of the phone.
M4ketech — 26-02-2023 16:29
inside the [qb]\qb-phone\config.lua find 
PhoneData.isOpen = true

I dont have such line
Ediz — 26-02-2023 20:37
cuz in client/main.lua if you search function in config you have in big trouble 