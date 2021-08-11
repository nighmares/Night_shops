
------- grocery store ----------



RegisterServerEvent('night_shops:chips')
AddEventHandler('night_shops:chips', function(price,item,amount)
    local user = source
    local xPlayer = ESX.GetPlayerFromId(user)
	local amount = tonumber(amount)
	price = price * amount
	

	if xPlayer.getMoney() >= price then
		
		if xPlayer.canCarryItem(item, amount) then
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(item, amount)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you bough '.. amount ..' '.. item ..''})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you cant carry this'})
		end
	else
		local max = price - xPlayer.getMoney()
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you are missing '.. max ..' dollars'})
	end	

end) 

----- illegal shop ------

RegisterServerEvent('night_shops:pistol')
AddEventHandler('night_shops:pistol', function(price,item,amount)
    local user = source
    local xPlayer = ESX.GetPlayerFromId(user)
	local amount = tonumber(amount)
	local objeto = xPlayer.getInventoryItem(item).label
	price = price * amount
	

	if xPlayer.getAccount('black_money').money >= price then
		
		if xPlayer.canCarryItem(item, amount) then
			xPlayer.removeAccountMoney('black_money', price)
			xPlayer.addInventoryItem(item, amount)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you bough '.. amount ..' '.. objeto ..''})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you cant carry this'})
		end
	else
		local max = price - xPlayer.getAccount('black_money').money
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you are missing '.. max ..' of dirty money!'})
	end	

end)



ESX.RegisterServerCallback('night_shop:checkPrie', function(source,cb, money) 
    local xPlayer = ESX.GetPlayerFromId(source)
   
	local have = xPlayer.getMoney()
	
	if money ~= nil then  
		if have >= money then
			
			cb(true)
		else
			
			cb(false)
		end
	end
end)

ESX.RegisterServerCallback('night_shop:checkblackmoney', function(source,cb, money) 
    local xPlayer = ESX.GetPlayerFromId(source)
   
	local have = xPlayer.getAccount('black_money').money
	
	if money ~= nil then  
		if have >= money then
			
			cb(true)
		else
			
			cb(false)
		end
	end
end)



