-- ESX
ESX.RegisterServerCallback('cbn_therapist:hasMoney', function(source, cb, money)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getMoney() >= money then
        xPlayer.removeMoney(money)
        cb(true)
    else
        cb(false)    
    end
end)
