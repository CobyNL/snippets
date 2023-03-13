CreateThread(function()
    SetDisableAmbientMeleeMove(PlayerPedId(), true)
      while true do
          Wait(1)
          local ped = PlayerPedId()
          if IsPedUsingActionMode(ped) then
        SetPedUsingActionMode(ped, -1, -1, 1)
      end
      end
  end)