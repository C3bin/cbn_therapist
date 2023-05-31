if Config.Framework == "qbcore" then
    QBCore.RegisterServerCallback('cbn_therapist:hasMoney', function(source, cb, money)
        local Player = QBCore.Functions.GetPlayer(source)
        if Player.PlayerData.money['cash'] >= money then
            Player.Functions.RemoveMoney('cash', money)
            cb(true)
        else
            cb(false)
        end
    end)
elseif Config.Framework == "esx" then
    ESX.RegisterServerCallback('cbn_therapist:hasMoney', function(source, cb, money)
        local xPlayer = ESX.GetPlayerFromId(source)
        if xPlayer.getMoney() >= money then
            xPlayer.removeMoney(money)
            cb(true)
        else
            cb(false)
        end
    end)
end
