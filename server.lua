
------- grocery store ----------

RegisterServerEvent('night_shops:burger')
AddEventHandler('night_shops:burger', function(itemname,amount)
    local user = source
    local xPlayer = ESX.GetPlayerFromId(user)
	local amount = tonumber(amount)
	local price = Config.burgerprice
	price = price * amount
	

	if xPlayer.getMoney() >= price then
		
		if xPlayer.canCarryItem(itemname, amount) then
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(itemname, amount)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you bough '.. amount ..' '.. itemname ..''})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you cant carry this'})
		end
	else
		local max = price - xPlayer.getMoney()
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you are missing '.. max ..' dollars'})
	end	

end) 

RegisterServerEvent('night_shops:chips')
AddEventHandler('night_shops:chips', function(itemname,amount)
    local user = source
    local xPlayer = ESX.GetPlayerFromId(user)
	local amount = tonumber(amount)
	local price = Config.chipsprice
	price = price * amount
	

	if xPlayer.getMoney() >= price then
		
		if xPlayer.canCarryItem(itemname, amount) then
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(itemname, amount)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you bough '.. amount ..' '.. itemname ..''})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you cant carry this'})
		end
	else
		local max = price - xPlayer.getMoney()
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you are missing '.. max ..' dollars'})
	end	

end)

RegisterServerEvent('night_shops:popcorn')
AddEventHandler('night_shops:popcorn', function(itemname,amount)
    local user = source
    local xPlayer = ESX.GetPlayerFromId(user)
	local amount = tonumber(amount)
	local price = Config.popcornprice
	price = price * amount
	

	if xPlayer.getMoney() >= price then
		
		if xPlayer.canCarryItem(itemname, amount) then
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(itemname, amount)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you bough '.. amount ..' '.. itemname ..''})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you cant carry this'})
		end
	else
		local max = price - xPlayer.getMoney()
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you are missing '.. max ..' dollars'})
	end	

end)

RegisterServerEvent('night_shops:sandwich')
AddEventHandler('night_shops:sandwich', function(itemname,amount)
    local user = source
    local xPlayer = ESX.GetPlayerFromId(user)
	local amount = tonumber(amount)
	local price = Config.sandwichprice
	price = price * amount
	

	if xPlayer.getMoney() >= price then
		
		if xPlayer.canCarryItem(itemname, amount) then
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(itemname, amount)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you bough '.. amount ..' '.. itemname ..''})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you cant carry this'})
		end
	else
		local max = price - xPlayer.getMoney()
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you are missing '.. max ..' dollars'})
	end	

end)

---------- liquor store server code -----------

RegisterServerEvent('night_shops:wine')
AddEventHandler('night_shops:wine', function(itemname,amount)
    local user = source
    local xPlayer = ESX.GetPlayerFromId(user)
	local amount = tonumber(amount)
	local price = Config.wineprice
	price = price * amount
	

	if xPlayer.getMoney() >= price then
		
		if xPlayer.canCarryItem(itemname, amount) then
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(itemname, amount)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you bough '.. amount ..' '.. itemname ..''})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you cant carry this'})
		end
	else
		local max = price - xPlayer.getMoney()
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you are missing '.. max ..' dollars'})
	end	

end) 

RegisterServerEvent('night_shops:tekila')
AddEventHandler('night_shops:tekila', function(itemname,amount)
    local user = source
    local xPlayer = ESX.GetPlayerFromId(user)
	local amount = tonumber(amount)
	local price = Config.tekilaprice
	price = price * amount
	

	if xPlayer.getMoney() >= price then
		
		if xPlayer.canCarryItem(itemname, amount) then
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(itemname, amount)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you bough '.. amount ..' '.. itemname ..''})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you cant carry this'})
		end
	else
		local max = price - xPlayer.getMoney()
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you are missing '.. max ..' dollars'})
	end	

end) 

RegisterServerEvent('night_shops:beer')
AddEventHandler('night_shops:beer', function(itemname,amount)
    local user = source
    local xPlayer = ESX.GetPlayerFromId(user)
	local amount = tonumber(amount)
	local price = Config.beerprice
	price = price * amount
	

	if xPlayer.getMoney() >= price then
		
		if xPlayer.canCarryItem(itemname, amount) then
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(itemname, amount)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you bough '.. amount ..' '.. itemname ..''})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you cant carry this'})
		end
	else
		local max = price - xPlayer.getMoney()
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you are missing '.. max ..' dollars'})
	end	

end) 

RegisterServerEvent('night_shops:vodka')
AddEventHandler('night_shops:vodka', function(itemname,amount)
    local user = source
    local xPlayer = ESX.GetPlayerFromId(user)
	local amount = tonumber(amount)
	local price = Config.vodkaprice
	price = price * amount
	

	if xPlayer.getMoney() >= price then
		
		if xPlayer.canCarryItem(itemname, amount) then
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(itemname, amount)
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you bough '.. amount ..' '.. itemname ..''})
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you cant carry this'})
		end
	else
		local max = price - xPlayer.getMoney()
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'inform', text = 'you are missing '.. max ..' dollars'})
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



