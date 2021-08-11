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

exports[Config.Target]:AddTargetModel({1397974313}, {
	options = {
		{
			event = "Night:illegalshop",
			icon = "fas fa-box-circle-check",
			label = "Open illegal shop"
		},
	},
    job = {"all"},
	distance = 2
})

end)

RegisterNetEvent('takeanim2')
AddEventHandler('takeanim2', function()
    ClearPedSecondaryTask(ESX.PlayerData.ped)
    loadAnimDict2("mp_safehouselost@") 
    TaskPlayAnim(ESX.PlayerData.ped, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
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
            header = "Burger",
            txt = "Price [10 each]",
            params = {
                event = "Night:grocery",
                args = {
                    price = Config.groceryprice1,
                },
                arg2 = {
                    item = Config.groceryitem1,
                }
                   
            }
        },
        {
            id = 3,
            header = "chips",
            txt = "Price [15 each]",
            params = {
                event = "Night:grocery",
                args = {
                    price = Config.groceryprice2,
                },
                arg2 = {
                    item = Config.groceryitem2,
                }
                
            }
        },
        {
            id = 4,
            header = "popcorn",
            txt = "Price [5 each]",
            params = {
                event = "Night:grocery",
                args = {
                    price = Config.groceryprice3,
                },
                arg2 = {
                    item = Config.groceryitem3,
                }
                
            }
        },
		{
            id = 5,
            header = "sandwich",
            txt = "Price [10 each]",
            params = {
                event = "Night:grocery",
                args = {
                    price = Config.groceryprice4,
                },
                arg2 = {
                    item = Config.groceryitem4,
                }
            }
        },
        
        
    })
end) 

------ shops client trigger ----

RegisterNetEvent('Night:grocery')
AddEventHandler('Night:grocery', function(items,money)
    local price = items.price
    local item = money.item

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
                TriggerServerEvent('night_shops:chips',price,item, keyboard[1].input)
            else
                exports['mythic_notify']:SendAlert('inform', ' you cant afford shit bud!')
            end
        end,price * keyboard[1].input)            

       
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
                event = "Night:grocery",
                args = {
                    price = Config.liquorprice1,
                },
                arg2 = {
                    item = Config.liquoritem1,
                }
                   
            }
        },
        {
            id = 3,
            header = "tekila",
            txt = "Price [15 each]",
            params = {
                event = "Night:grocery",
                args = {
                    price = Config.liquorprice2,
                },
                arg2 = {
                    item = Config.liquoritem2,
                }
                
            }
        },
        {
            id = 4,
            header = "beer",
            txt = "Price [5 each]",
            params = {
                event = "Night:grocery",
                args = {
                    price = Config.liquorprice3,
                },
                arg2 = {
                    item = Config.liquoritem3,
                }
                
            }
        },
		{
            id = 5,
            header = "vodka",
            txt = "Price [10 each]",
            params = {
                event = "Night:grocery",
                args = {
                    price = Config.liquorprice4,
                },
                arg2 = {
                    item = Config.liquoritem4,
                }
            }
        },
        
        
    })
end) 
----- illegal item shop -----

RegisterNetEvent('Night:illegalshop', function()
    TriggerEvent('nh-context:sendMenu', {
        {
            id = 1,
            header = "illegal shop",
            txt = ""
        },
        {
            id = 2,
            header = "pistol",
            txt = "",
            params = {
                event = "Night:weapons",
                args = {
                    price = Config.weaponprice1,
                },
                arg2 = {
                    item = Config.weaponitem1,
                }
                   
            }
        },
        {
            id = 3,
            header = "smg",
            txt = "",
            params = {
                event = "Night:weapons",
                args = {
                    price = Config.weaponprice2,
                },
                arg2 = {
                    item = Config.weaponitem2,
                }
                
            }
        },
        {
            id = 4,
            header = "bat",
            txt = "",
            params = {
                event = "Night:weapons",
                args = {
                    price = Config.weaponprice3,
                },
                arg2 = {
                    item = Config.weaponitem3,
                }
                
            }
        },
		{
            id = 5,
            header = "knife",
            txt = "",
            params = {
                event = "Night:weapons",
                args = {
                    price = Config.weaponprice4,
                },
                arg2 = {
                    item = Config.weaponitem4,
                }
            }
        },
        
        
    })
end)

RegisterNetEvent('Night:weapons')
AddEventHandler('Night:weapons', function(items,money)
    local price = items.price
    local item = money.item

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
        ESX.TriggerServerCallback('night_shop:checkblackmoney', function(hasMoney)
            if hasMoney then
                TriggerEvent('takeanim2')
                Citizen.Wait(2000)
                TriggerServerEvent('night_shops:pistol',price,item, keyboard[1].input)
            else
                exports['mythic_notify']:SendAlert('inform', ' you cant afford shit bud!')
            end
        end,price * keyboard[1].input) 
    end
end)









