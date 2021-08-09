local PlayerData = {}
local genderNum = 0
local distancecheck = false


Citizen.CreateThread(function()

	while true do
		Citizen.Wait(100)
		for k,v in pairs (Config.main) do
			local id = GetEntityCoords(PlayerPedId())
			local distancia = #(id - v.coords)
			
			if distancia < Config.Distancia and distancecheck == false then
				spawn(v.modelo, v.coords, v.heading, v.gender, v.animDict, v.animName)
				distancecheck = true
			end
			if distancia >= Config.Distancia and distancia <= Config.Distancia + 1 then
				
				distancecheck = false
				DeletePed(ped)
			end
		end
	end
	
	
end)

function spawn(modelo, coords, heading, gender, animDict, animName)
	
	RequestModel(GetHashKey(modelo))
	while not HasModelLoaded(GetHashKey(modelo)) do
		Citizen.Wait(1)
	end
	
	if gender == 'male' then
		genderNum = 4
	elseif gender == 'female' then 
		genderNum = 5
	end	

	
	local x, y, z = table.unpack(coords)
	ped = CreatePed(genderNum, GetHashKey(modelo), x, y, z - 1, heading, false, true)
		
	
	
	SetEntityAlpha(ped, 255, false)
	FreezeEntityPosition(ped, true) 
	SetEntityInvincible(ped, true) 
	SetBlockingOfNonTemporaryEvents(ped, true) 
	
	if animDict and animName then
		RequestAnimDict(animDict)
		while not HasAnimDictLoaded(animDict) do
			Citizen.Wait(1)
		end
		TaskPlayAnim(ped, animDict, animName, 8.0, 0, -1, 1, 0, 0, 0)
	end
	
	
end
Citizen.CreateThread(function()
    local peds = {
        233415434,
    }
---- target stuff ----
exports[Config.Target]:AddTargetModel(peds, {
	options = {
		{
			event = "Night:regularshop",
			icon = "fas fa-utensils",
			label = "Open Grocery store"
		},
	},
    job = {"all"},
	distance = 2
})

exports[Config.Target]:AddTargetModel({-1059388209}, {
	options = {
		{
			event = "Night:alcoholshop",
			icon = "fas fa-box-circle-check",
			label = "Open liquor store"
		},
	},
    job = {"all"},
	distance = 2
})

end)

--[[
RegisterCommand("market", function(source, args, rawCommand)    ----debug commnad
    TriggerEvent('Night:regularshop')
end)]]

RegisterNetEvent('takeanim2')
AddEventHandler('takeanim2', function()
    ClearPedSecondaryTask(GetPlayerPed(-1))
    loadAnimDict2("mp_safehouselost@") 
    TaskPlayAnim(GetPlayerPed(-1), "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
end)

function loadAnimDict2( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end


----- grocery store ---
RegisterNetEvent('Night:regularshop', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "Shop",
            txt = ""
        },
        {
            id = 2,
            header = "Bread",
            txt = "Price [10 each]",
            params = {
                event = "Night:dialogmenu",
                args = {
                    itemname = 'burger',
                   
                    
                }
                   
            }
        },
        {
            id = 3,
            header = "chips",
            txt = "Price [15 each]",
            params = {
                event = "Night:dialogmenu2",
                args = {
                    itemname = 'chips',
                    
                }
                
            }
        },
        {
            id = 4,
            header = "popcorn",
            txt = "Price [5 each]",
            params = {
                event = "Night:dialogmenu3",
                args = {
                    itemname = 'popcorn',
                    
                }
                
            }
        },
		{
            id = 5,
            header = "sandwich",
            txt = "Price [10 each]",
            params = {
                event = "Night:dialogmenu4",
                args = {
                    itemname = 'sandwich',
                    
                }
            }
        },
        
        
    })
end)

RegisterNetEvent('Night:dialogmenu')
AddEventHandler('Night:dialogmenu', function(items)
    local itemname = items.itemname

    local keyboard = exports["nh-keyboard"]:KeyboardInput({
        header = "Amount to buy", 
        rows = {
            {
                id = 0, 
                txt = "numbers!!"
            }
        }
    })
    if keyboard ~= nil then
        TriggerEvent('takeanim2')
        Citizen.Wait(2000)
        TriggerServerEvent('night_shops:burger',itemname, keyboard[1].input)
    end
end)  

RegisterNetEvent('Night:dialogmenu2')
AddEventHandler('Night:dialogmenu2', function(items)
    local itemname = items.itemname

    local keyboard = exports["nh-keyboard"]:KeyboardInput({
        header = "Amount to buy", 
        rows = {
            {
                id = 0, 
                txt = "numbers!!"
            }
        }
    })
    if keyboard ~= nil then

        ESX.TriggerServerCallback('night_shop:checkPrie', function(hasMoney)
            if hasMoney then
                TriggerEvent('takeanim2')
                Citizen.Wait(2000)
                TriggerServerEvent('night_shops:chips',itemname, keyboard[1].input)
            else
                exports['mythic_notify']:SendAlert('inform', ' you cant afford shit bud!')
            end
        end,5)            

       
    end
end) 

RegisterNetEvent('Night:dialogmenu3')
AddEventHandler('Night:dialogmenu3', function(items)
    local itemname = items.itemname

    local keyboard = exports["nh-keyboard"]:KeyboardInput({
        header = "Amount to buy", 
        rows = {
            {
                id = 0, 
                txt = "numbers!!"
            }
        }
    })
    if keyboard ~= nil then
        TriggerEvent('takeanim2')
        Citizen.Wait(2000)
        TriggerServerEvent('night_shops:popcorn',itemname, keyboard[1].input)
    end
end) 

RegisterNetEvent('Night:dialogmenu4')
AddEventHandler('Night:dialogmenu4', function(items)
    local itemname = items.itemname

    local keyboard = exports["nh-keyboard"]:KeyboardInput({
        header = "Amount to buy", 
        rows = {
            {
                id = 0, 
                txt = "numbers!!"
            }
        }
    })
    if keyboard ~= nil then
        TriggerEvent('takeanim2')
        Citizen.Wait(2000)
        TriggerServerEvent('night_shops:sandwich',itemname, keyboard[1].input)
    end
end) 

------ liquor store -------

RegisterNetEvent('Night:alcoholshop', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "licour store",
            txt = ""
        },
        {
            id = 2,
            header = "wine",
            txt = "Price [10 each]",
            params = {
                event = "Night:wine",
                args = {
                    itemname = 'wine',
                   
                    
                }
                   
            }
        },
        {
            id = 3,
            header = "tekila",
            txt = "Price [15 each]",
            params = {
                event = "Night:tekila",
                args = {
                    itemname = 'tekila',
                    
                }
                
            }
        },
        {
            id = 4,
            header = "beer",
            txt = "Price [5 each]",
            params = {
                event = "Night:beer",
                args = {
                    itemname = 'beer',
                    
                }
                
            }
        },
		{
            id = 5,
            header = "vodka",
            txt = "Price [10 each]",
            params = {
                event = "Night:vodka",
                args = {
                    itemname = 'vodka',
                    
                }
            }
        },
        
        
    })
end) 

RegisterNetEvent('Night:wine')
AddEventHandler('Night:wine', function(items)
    local itemname = items.itemname

    local keyboard = exports["nh-keyboard"]:KeyboardInput({
        header = "Amount to buy", 
        rows = {
            {
                id = 0, 
                txt = "numbers!!"
            }
        }
    })
    if keyboard ~= nil then
        TriggerEvent('takeanim2')
        Citizen.Wait(2000)
        TriggerServerEvent('night_shops:wine',itemname, keyboard[1].input)
    end
end)

RegisterNetEvent('Night:tekila')
AddEventHandler('Night:tekila', function(items)
    local itemname = items.itemname

    local keyboard = exports["nh-keyboard"]:KeyboardInput({
        header = "Amount to buy", 
        rows = {
            {
                id = 0, 
                txt = "numbers!!"
            }
        }
    })
    if keyboard ~= nil then
        TriggerEvent('takeanim2')
        Citizen.Wait(2000)
        TriggerServerEvent('night_shops:tekila',itemname, keyboard[1].input)
    end
end)

RegisterNetEvent('Night:beer')
AddEventHandler('Night:beer', function(items)
    local itemname = items.itemname

    local keyboard = exports["nh-keyboard"]:KeyboardInput({
        header = "Amount to buy", 
        rows = {
            {
                id = 0, 
                txt = "numbers!!"
            }
        }
    })
    if keyboard ~= nil then
        TriggerEvent('takeanim2')
        Citizen.Wait(2000)
        TriggerServerEvent('night_shops:beer',itemname, keyboard[1].input)
    end
end)

RegisterNetEvent('Night:vodka')
AddEventHandler('Night:vodka', function(items)
    local itemname = items.itemname

    local keyboard = exports["nh-keyboard"]:KeyboardInput({
        header = "Amount to buy", 
        rows = {
            {
                id = 0, 
                txt = "numbers!!"
            }
        }
    })
    if keyboard ~= nil then
        TriggerEvent('takeanim2')
        Citizen.Wait(2000)
        TriggerServerEvent('night_shops:vodka',itemname, keyboard[1].input)
    end
end)









