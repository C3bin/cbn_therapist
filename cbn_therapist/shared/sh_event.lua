AddEventHandler("cbn_therapist:relieveStress", function(source)
    TriggerServerEvent('hud:server:RelieveStress', Config.StressAmount) -- Here you can add your own custom event/export
end)

