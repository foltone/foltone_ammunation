ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent("foltone_ammunation:buyItem")
AddEventHandler("foltone_ammunation:buyItem", function(type, name, price)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getAccount("money").money >= price then
        if type == "weapon" then
            xPlayer.addWeapon(name, 12)
        elseif xPlayer.canCarryItem(name, 1) then
            xPlayer.addInventoryItem(name, 1)
        else
            TriggerClientEvent("foltone_ammunation:notification", _source, _U("not_enough_space"))
            return
        end
        TriggerClientEvent("foltone_ammunation:notification", _source, _U("bought", name, price))
    else
        TriggerClientEvent("foltone_ammunation:notification", _source, _U("not_enough_money"))
    end
end)
