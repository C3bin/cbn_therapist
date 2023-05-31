if Config.TargetSystem == 'ox_target' then
    exports.ox_target:addSphereZone({
        coords = vec3(-1899.0, -572.08, 11.84),
        radius = Config.TargetDistance,
        debug = drawZones,
        options = {
            {
                event = 'startCutScene',
                icon = 'fas fa-shoe-prints',
                label = _U('deal_meeting')
            }
        }
    })
elseif Config.TargetSystem == 'qtarget' then
    exports.qtarget:AddCircleZone("start_scene", vec3(-1899.0, -572.08, 11.84),
                                  2.50, {
        useZ = true,
        name = "start_scene",
        debugPoly = false
    }, {
        options = {
            {
                event = 'startCutScene',
                icon = "fas fa-shoe-prints",
                label = _U('deal_meeting')
            }
        },
        distance = Config.TargetDistance
    })
elseif Config.TargetSystem == 'qbtarget' then
    exports['qb-target']:AddCircleZone("start_scene", vec3(-1899.0, -572.08, 11.84),
                                  2.50, {
        useZ = true,
        name = "start_scene",
        debugPoly = false
    }, {
        options = {
            {
                event = 'startCutScene',
                icon = "fas fa-shoe-prints",
                label = _U('deal_meeting')
            }
        },
        distance = Config.TargetDistance
    })
end

if Config.Framework == "esx" then
    RegisterNetEvent('startCutScene', function(data)
        lib.registerContext({
            id = 'dealMeet',
            title = _U('requestMeet'),
            menu = 'dealMeet',
            options = {
                [_U('deal_meeting')] = {
                    metadata = {_U('deal_meeting')},
                    onSelect = function()
                        local money = Config.PriceForSitting
                        ESX.TriggerServerCallback("cbn_therapist:hasMoney", function(hasMoney)
                            RequestModel(GetHashKey("cs_drfriedlander"))
                            while not HasModelLoaded(GetHashKey("cs_drfriedlander")) do
                                Citizen.Wait(1)
                            end

                            if hasMoney then
                                SetEntityCoords(PlayerPedId(), -1897.8439, -572.8386, 11.8461, false, false, false, true)
                                local doctor = CreatePed(8, GetHashKey("cs_drfriedlander"), -1898.5520, -572.3199, 11.8426, 226.7172, false, true)
                                lib.progressBar({
                                    duration = 5000,
                                    label = _U('dealing_meeting'),
                                    useWhileDead = false,
                                    canCancel = true,
                                    disable = {car = true, move = true},
                                    anim = {
                                        dict = 'missheistfbi_fire',
                                        clip = 'two_talking'
                                    }
                                })
                                DeletePed(doctor)
                                local playerId = PlayerPedId()

                                local clothing = exports[Config.SkinSystem]:getPedAppearance(PlayerPedId())

                                DoScreenFadeOut(1000)
                                Wait(1000)

                                RequestCutscene('drf_mic_1_cs_1', 8)
                                while not HasCutsceneLoaded() do
                                    Wait(0)
                                end

                                SetCutsceneEntityStreamingFlags('Michael', 0, 1)
                                RegisterEntityForCutscene(PlayerPedId(), 'Michael', 0, 0, 64)
                                DoScreenFadeIn(2000)
                                StartCutscene(0)

                                while not DoesCutsceneEntityExist('Michael', 0) do
                                    Wait(0)
                                end

                                exports[Config.SkinSystem]:setPedAppearance(PlayerPedId(), clothing)
                                StartCutscene(0)
                                local ped = PlayerPedId()
                                local playerId = PlayerPedId()
                                lib.progressBar({
                                    duration = 40000,
                                    label = _U('talking'),
                                    useWhileDead = false,
                                    canCancel = false
                                })
                                DoScreenFadeOut(1000)
                                Wait(2000)
                                StopCutsceneImmediately()
                                DoScreenFadeIn(1000)
                                local playerId = PlayerPedId()
                                SetEntityCoords(PlayerPedId(), -1897.8439, -572.8386, 11.8461, false, false, false, true)
                                if Config.UseStressSystem == true and Config.StressSystem == 'codem' then
                                    TriggerServerEvent('hud:server:RelieveStress', 50)
                                    ESX.ShowNotification(_U('feel_better_stress'))
                                elseif Config.UseStressSystem == true and Config.StressSystem == 'codesign' then
                                    TriggerEvent('cd_playerhud:status:remove', 'stress', Config.StressAmount)
                                    ESX.ShowNotification(_U('feel_better_stress'))
                                elseif Config.UseStressSystem == true and Config.StressSystem == 'ultra' then
                                    TriggerServerEvent("stress:remove", Config.StressAmount)
                                    ESX.ShowNotification(_U('feel_better_stress'))
                                elseif Config.UseStressSystem == false then
                                    TriggerEvent('cbn_therapist:relieveStress')
                                    ESX.ShowNotification(_U('feel_better_stress'))
                                else
                                    ESX.ShowNotification(_U('feel_better'))
                                end

                            else
                                ESX.ShowNotification(_U('no_money'))
                            end
                        end, money)
                    end
                }
            }
        })
        lib.showContext('dealMeet')
    end)
elseif Config.Framework == "qbcore" then
    RegisterNetEvent('startCutScene', function(data)
        lib.registerContext({
            id = 'dealMeet',
            title = _U('requestMeet'),
            menu = 'dealMeet',
            options = {
                [_U('deal_meeting')] = {
                    metadata = {_U('deal_meeting')},
                    onSelect = function()
                        local money = Config.PriceForSitting

                        QBCore.Functions.TriggerCallback('cbn_therapist:hasMoney', function(hasMoney)
                            RequestModel(GetHashKey("cs_drfriedlander"))
                            while not HasModelLoaded(GetHashKey("cs_drfriedlander")) do
                                Citizen.Wait(1)
                            end

                            if hasMoney then
                                SetEntityCoords(PlayerPedId(), -1897.8439, -572.8386, 11.8461, false, false, false, true)
                                local doctor = CreatePed(8, GetHashKey("cs_drfriedlander"), -1898.5520, -572.3199, 11.8426, 226.7172, false, true)

                                lib.progressBar({
                                    duration = 5000,
                                    label = _U('dealing_meeting'),
                                    useWhileDead = false,
                                    canCancel = true,
                                    disable = {car = true, move = true},
                                    anim = {
                                        dict = 'missheistfbi_fire',
                                        clip = 'two_talking'
                                    }
                                })
                                DeletePed(doctor)

                                local clothing = exports[Config.SkinSystem]:getPedAppearance(PlayerPedId())

                                DoScreenFadeOut(1000)
                                Wait(1000)

                                RequestCutscene('drf_mic_1_cs_1', 8)
                                while not HasCutsceneLoaded() do
                                    Wait(0)
                                end

                                SetCutsceneEntityStreamingFlags('Michael', 0, 1)
                                RegisterEntityForCutscene(PlayerPedId(), 'Michael', 0, 0, 64)
                                DoScreenFadeIn(2000)
                                StartCutscene(0)

                                while not DoesCutsceneEntityExist('Michael', 0) do
                                    Wait(0)
                                end

                                exports[Config.SkinSystem]:setPedAppearance(PlayerPedId(), clothing)
                                StartCutscene(0)

                                lib.progressBar({
                                    duration = 40000,
                                    label = _U('talking'),
                                    useWhileDead = false,
                                    canCancel = false
                                })

                                DoScreenFadeOut(1000)
                                Wait(2000)
                                StopCutsceneImmediately()
                                DoScreenFadeIn(1000)

                                SetEntityCoords(PlayerPedId(), -1897.8439, -572.8386, 11.8461, false, false, false, true)

                                if Config.UseStressSystem == true and Config.StressSystem == 'codem' then
                                    TriggerServerEvent('hud:server:RelieveStress', 50)
                                    QBCore.Functions.Notify(_U('feel_better_stress'))
                                elseif Config.UseStressSystem == true and Config.StressSystem == 'codesign' then
                                    TriggerEvent('cd_playerhud:status:remove', 'stress', Config.StressAmount)
                                    QBCore.Functions.Notify(_U('feel_better_stress'))
                                elseif Config.UseStressSystem == true and Config.StressSystem == 'ultra' then
                                    TriggerServerEvent("stress:remove", Config.StressAmount)
                                    QBCore.Functions.Notify(_U('feel_better_stress'))
                                elseif Config.UseStressSystem == false then
                                    TriggerEvent('cbn_therapist:relieveStress')
                                    QBCore.Functions.Notify(_U('feel_better_stress'))
                                else
                                    QBCore.Functions.Notify(_U('feel_better'))
                                end

                            else
                                QBCore.Functions.Notify(_U('no_money'))
                            end
                        end, money)
                    end
                }
            }
        })
        lib.showContext('dealMeet')
    end)
end
