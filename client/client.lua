local news ={}

news.Open = function()
    SendNUIMessage({
        action = "open"
    })
	newspaper = CreateObject(GetHashKey("prop_cliff_paper"), 0, 0, 0, true, true, true)
	RequestAnimDict("missfam4")
	while not HasAnimDictLoaded("missfam4") do Citizen.Wait(5) end
	TaskPlayAnim(PlayerPedId(), "missfam4", "base", 3.0, 2.0, -1, 33, 0.0, false, false, false)
	AttachEntityToEntity(newspaper, PlayerPedId(), GetPedBoneIndex(GetPlayerPed(-1), 18905), 0.26, 0.06, 0.16, 320.0, 310.0, 0.0, true, true, false, true, 1, true)
    SetNuiFocus(true, true)
    display = true
end

RegisterNUICallback('close', function()
    SetNuiFocus(false, false)
	ClearPedTasks(PlayerPedId())
	Citizen.Wait(200)
	DeleteObject(newspaper)
    display = false
end)

RegisterNetEvent('news:open',function()
	news.Open()
end)

--[[Using qb-target]]--
exports['qb-target']:AddTargetModel(1211559620, { -- Red Daily Rag Dispenser
    options = {
        {
            type = "client",
            event = "news:open",
            icon = "fa fa-list-alt",
            label = "Read Newspaper",
        },
    },
    distance = 2.5
})
--[[]]--

--[[Using draw text based on locations
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(5)
		local playerPed = PlayerPedId()
		local pos = GetEntityCoords(playerPed)
		for k, v in pairs(Config.NewsLocations) do
			local dist = #(pos - vector3(Config.NewsLocations[k].NewsLocation.x, Config.NewsLocations[k].NewsLocation.y, Config.NewsLocations[k].NewsLocation.z))
			if dist < 1.5 then
				DrawText3D(Config.NewsLocations[k].NewsLocation.x, Config.NewsLocations[k].NewsLocation.y, Config.NewsLocations[k].NewsLocation.z + 0.5, "Press ~g~E~w~ ~n~ To Read Newspaper ")
				if IsControlJustReleased(0, 38) then
					news.Open()
				end
			end
		end
	end
end)


function DrawText3D(x, y, z, text) -- allows for multiple lines from " ~n~ " (needs spaces)
	SetTextScale(0.35, 0.35)
	SetTextFont(4)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 215)
	SetTextEntry("STRING")
	SetTextCentre(true)
	AddTextComponentString(text)
	SetDrawOrigin(x, y, z, 0)
	DrawText(0.0, 0.0)
	local textl = string.len(text)
	local t = {}
	t[1] = 0
  local i = 0
	local count = 1
  while true do
		i = string.find(text, " %~%n%~", i+1) -- find 'next' newline
		if i == nil then break end
		t[count + 1] = i	  
		count = count + 1
  end
	t[count + 1] = textl
	width = t[1]
	for lin = 2, #t do
		if(t[lin] - t[lin -1]) > width then
			width = t[lin] - t[lin -1]
		end
	end
	local factor = width / 370
	DrawRect(0.0, 0.0 + (0.01 * count) + 0.0025, 0.017 + factor, 0.02 * count + 0.01, 0, 0, 0, 127)
	ClearDrawOrigin()
end
]]--