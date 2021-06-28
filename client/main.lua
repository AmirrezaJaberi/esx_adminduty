------------------- ESX -------------------
ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
    end
end)

----------------- Don't Change -------------------
local IsSpecting = false
local AdminTags  = {}
local CanShowOwn = false
local noclip     = false
----------------- Tag Status -----------------
RegisterNetEvent('esx_adminduty:ChangeTagStatus')
AddEventHandler('esx_adminduty:ChangeTagStatus', function (tags)
    AdminTags = tags
end)

RegisterNetEvent('esx_adminduty:ChangeTagOwn')
AddEventHandler('esx_adminduty:ChangeTagOwn', function (status)
    CanShowOwn = status
end)

------------------- Spawn Car -------------------
RegisterNetEvent('esx_adminduty:SpawnVehicle')
AddEventHandler('esx_adminduty:SpawnVehicle', function (model)

    local pped = PlayerPedId()
    local PCoords = GetEntityCoords(pped)
    print(json.encode(PCoords))
    local VehMod = GetHashKey(model)

    RequestModel(VehMod)

    while not HasModelLoaded(VehMod) do
        Citizen.Wait(2000)
    end
     ESX.Game.SpawnVehicle(VehMod, vector3(PCoords.x, PCoords.y, PCoords.z), 100.0, function (veh)
        SetPedIntoVehicle(pped, veh, -1)
    end)
end)

------------------- Delete Vehicle -------------------
RegisterNetEvent('esx_adminduty:DeleteVehicle')
AddEventHandler('esx_adminduty:DeleteVehicle', function ()
    local pped = PlayerPedId()
    if IsPedInAnyVehicle(pped, true) then
        local veh = GetVehiclePedIsIn(pped, false)
        ESX.Game.DeleteVehicle(veh)
    end
end)

------------------- Show Admins -------------------
RegisterNetEvent('esx_adminduty:AddCommandSuggestion')
AddEventHandler('esx_adminduty:AddCommandSuggestion', function ()
    TriggerEvent('chat:addSuggestion', '/setjob', 'Change or Set Job For Player', {
        { name="ID", help="Player ID" },
        { name="Job Name", help="Job Name as Police or etc ." },
        { name="Job Grade", help="Job Greade For Example : 4"}
    })
    TriggerEvent('chat:addSuggestion', '/setmoney', 'Add Money For Player', {
        { name="ID", help="Player ID" },
        { name="Type", help="Cash or Bank" },
        { name="Ammount", help="For Example : 2000000"}
    })
    TriggerEvent('chat:addSuggestion', '/aduty', 'Admin Duty', {})
    TriggerEvent('chat:addSuggestion', '/removeweapon', 'Remove All Weapon Form Player', {
        { name="ID", help="Player ID" },
    })
    TriggerEvent('chat:addSuggestion', '/kick', 'Kick A Player', {
        { name="ID", help="Player ID" },
        { name="Resson", help="Resson : Bug or etc." },
    })
    TriggerEvent('chat:addSuggestion', '/freeze', 'Freeze A Player', {
        { name="ID", help="Player ID" },
    })
    TriggerEvent('chat:addSuggestion', '/unfreeze', 'Freeze A Player', {
        { name="ID", help="Player ID" },
    })
    TriggerEvent('chat:addSuggestion', '/slay', 'Kill A Player', {
        { name="ID", help="Player ID" },
    })
    TriggerEvent('chat:addSuggestion', '/goto', 'Teleport To Player', {
        { name="ID", help="Player ID" },
    })
    TriggerEvent('chat:addSuggestion', '/bring', 'Bring To Player', {
        { name="ID", help="Player ID" },
    })
    TriggerEvent('chat:addSuggestion', '/announce', 'Announce For All Player', {
        { name="Text", help="Text for Player" },
    })
    TriggerEvent('chat:addSuggestion', '/tpm', 'Teleport To Mark Form Map', {})
    TriggerEvent('chat:addSuggestion', '/getinfo', 'Get Player Info', {
        { name="ID", help="Player ID" },
    })
    TriggerEvent('chat:addSuggestion', '/changeped', 'Change Player Ped', {
        { name="Ped Name", help="For Example : a_c_rhesus" },
    })
    TriggerEvent('chat:addSuggestion', '/resetped', 'Reset Player Ped', {})
    TriggerEvent('chat:addSuggestion', '/setarmor', 'Set Player Armor', {
        { name="ID", help="Player ID" },
        { name="Ammount", help="Max : 100" },
    })
    TriggerEvent('chat:addSuggestion', '/heal', 'Heal A Player', {
        { name="ID", help="Player ID" },
    })
    TriggerEvent('chat:addSuggestion', '/revive', 'Revive A Player', {
        { name="ID", help="Player ID" },
    })
    TriggerEvent('chat:addSuggestion', '/car', 'Spawn A Vehicle', {
        { name="Name", help="For Example : neon" },
    })
    TriggerEvent('chat:addSuggestion', '/dv', 'Delete Vehicle', {})
    TriggerEvent('chat:addSuggestion', '/giveitem', 'Give Item To Player', {
        { name="ID", help="Player ID" },
        { name="Item", help="For Example : phone" },
        { name="Ammount", help="For Example : 10" },
    })
    TriggerEvent('chat:addSuggestion', '/giveweapon', 'Give Weapon To Player', {
        { name="ID", help="Player ID" },
        { name="Weapon", help="For Example : weapon_smg" },
        { name="Ammo", help="For Example : 250" },
    })
    TriggerEvent('chat:addSuggestion', '/clearinventory', 'Clear Inventory', {
        { name="ID", help="Player ID" },
    })
    TriggerEvent('chat:addSuggestion', '/clearloadout', 'Clear Loadout', {
        { name="ID", help="Player ID" },
    })
    TriggerEvent('chat:addSuggestion', '/setgroup', 'Set Player Group', {
        { name="ID", help="Player ID" },
        { name="Name", help="For Example : admin or user or etc ." },
    })
    TriggerEvent('chat:addSuggestion', '/save', 'Save A Player', {
        { name="ID", help="Player ID" },
    })
    TriggerEvent('chat:addSuggestion', '/saveall', 'Save All Player', {})
    TriggerEvent('chat:addSuggestion', '/noclip', 'Noclip for Fly', {})
    TriggerEvent('chat:addSuggestion', '/fix', 'Fix Vehicle', {
        { name="ID", help="Player ID" },
    })
end)

------------------- Show Admins -------------------
RegisterNetEvent('esx_adminduty:fix')
AddEventHandler('esx_adminduty:fix', function ()
    local pped = PlayerPedId()
    if IsPedInAnyVehicle(pped, 1) then
        local veh = GetVehiclePedIsIn(pped, 1)
        SetVehicleEngineHealth(veh, 1000)
        SetVehicleDirtLevel(veh, 0)
		SetVehicleEngineOn(veh, true, true)
		SetVehicleFixed(veh)
    end
end)

------------------- Freeze -------------------
RegisterNetEvent('esx_adminduty:freeze')
AddEventHandler('esx_adminduty:freeze', function ()
    local pped = PlayerPedId()
    SetEntityInvincible(pped, true)
end)

------------------- Un Freeze -------------------
RegisterNetEvent('esx_adminduty:unfreeze')
AddEventHandler('esx_adminduty:unfreeze', function ()
    local pped = PlayerPedId()
    SetEntityInvincible(pped, false)
end)

------------------- Slay -------------------
RegisterNetEvent('esx_adminduty:slay')
AddEventHandler('esx_adminduty:slay', function ()
    SetEntityHealth(PlayerPedId(), 0)
end)

------------------- TPM -------------------
RegisterNetEvent('esx_adminduty:tpm')
AddEventHandler('esx_adminduty:tpm', function ()
    TeleportToWaypoint()
end)

---------------- Change Ped ----------------
RegisterNetEvent('esx_adminduty:ChangePed')
AddEventHandler('esx_adminduty:ChangePed', function (ped)
    Citizen.CreateThread(function()
    local model = GetHashKey(ped)

    RequestModel(model)
    while not HasModelLoaded(model) do
        RequestModel(model)
        Citizen.Wait(0)
    end

    SetPlayerModel(PlayerId(), model)
    end)
end)
---------------- Reset Ped ----------------
RegisterNetEvent('esx_adminduty:ResetPed')
AddEventHandler('esx_adminduty:ResetPed', function ()
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
        local isMale = skin.sex == 0
        TriggerEvent('skinchanger:loadDefaultModel', isMale, function()
            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                TriggerEvent('skinchanger:loadSkin', skin)
                Citizen.CreateThread(function()
                    Citizen.Wait(250)
                end)
            end)
        end)
    end)
end)

---------- Remove All Weapon -----------
RegisterNetEvent('esx_adminduty:RemoveAllWeapon')
AddEventHandler('esx_adminduty:RemoveAllWeapon', function ()
    local ped = GetPlayerPed(PlayerPedId())
    RemoveAllPedWeapons(ped, true)
end)

---------- Heal ----------
RegisterNetEvent('esx_adminduty:healplayer')
AddEventHandler('esx_adminduty:healplayer', function ()
    local playerPed = PlayerPedId()
	TriggerEvent('esx_status:set', 'hunger', 1000000)
	TriggerEvent('esx_status:set', 'thirst', 1000000)
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)

---------- Set Armor ----------
RegisterNetEvent('esx_adminduty:SetArmor')
AddEventHandler('esx_adminduty:SetArmor', function (ammount)
    local pped = PlayerPedId()
    SetPedArmour(pped, ammount)
end)

---------- Noclip ----------
RegisterNetEvent("esx_adminduty:noclip")
AddEventHandler("esx_adminduty:noclip", function(input)
    local player = PlayerId()
	local ped = PlayerPedId
	
    local msg = "disabled"
	if(noclip == false)then
		noclip_pos = GetEntityCoords(PlayerPedId(), false)
	end

	noclip = not noclip

	if(noclip)then
		msg = "enabled"
	end

	TriggerEvent("chatMessage", "Noclip has been ^1^*" .. msg)
	end)
	
	local heading = 0
	Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)

		if(noclip)then
			SetEntityCoordsNoOffset(PlayerPedId(), noclip_pos.x, noclip_pos.y, noclip_pos.z, 0, 0, 0)

			if(IsControlPressed(1, 34))then
				heading = heading + 1.5
				if(heading > 360)then
					heading = 0
				end

				SetEntityHeading(PlayerPedId(), heading)
			end

			if(IsControlPressed(1, 9))then
				heading = heading - 1.5
				if(heading < 0)then
					heading = 360
				end

				SetEntityHeading(PlayerPedId(), heading)
			end

			if(IsControlPressed(1, 8))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 1.0, 0.0)
			end

			if(IsControlPressed(1, 32))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, -1.0, 0.0)
			end

			if(IsControlPressed(1, 27))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, 1.0)
			end

			if(IsControlPressed(1, 173))then
				noclip_pos = GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 0.0, -1.0)
			end
		else
			Citizen.Wait(200)
		end
	end
end)


------------------- POS -------------------
RegisterCommand('pos', function (source)
    local pped = PlayerPedId()
    local ppedc = GetEntityCoords(pped)
    local message = "{x= "..ppedc.x..", y = "..ppedc.y..", z = "..ppedc.z.."},"
    TriggerServerEvent('esx_adminduty:coords', message)
    print(message)
end)



------------------- Teleport To Waypoint -------------------
function TeleportToWaypoint()
            local WaypointHandle = GetFirstBlipInfoId(8)
            if DoesBlipExist(WaypointHandle) then
                local waypointCoords = GetBlipInfoIdCoord(WaypointHandle)
                for height = 1, 1000 do
                    SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
                    local foundGround, zPos = GetGroundZFor_3dCoord(waypointCoords["x"], waypointCoords["y"], height + 0.0)
                    if foundGround then
                        SetPedCoordsKeepVehicle(PlayerPedId(), waypointCoords["x"], waypointCoords["y"], height + 0.0)
                        break
                    end
                    Citizen.Wait(5)
                end
            ESX.ShowNotification("Teleported !!")
        else
        ESX.ShowNotification("Please Mark On Map")
    end
end

-------------- Admin Tag --------------
if Config.Tag.enable then
    Citizen.CreateThread(function ()
        while true do
            Citizen.Wait(0)
            local currentPed = PlayerPedId()
            local currentPos = GetEntityCoords(currentPed)
            local cx,cy,cz = table.unpack(currentPos)
            cz = cz + 1.2
            local label = "~p~ ~r~"
             if CanShowOwn then
                DrawText3D(vector3(cx,cy,cz), label .. GetPlayerName(PlayerId()), 1.5)
             end
            for k, v in pairs(AdminTags) do
                local adminPed = GetPlayerPed(GetPlayerFromServerId(v.source))
                local adminCoords = GetEntityCoords(adminPed)
                local x,y,z = table.unpack(adminCoords)
                z = z + 1.2
                local distance = GetDistanceBetweenCoords(vector3(cx,cy,cz), vector3(x,y,z), true)
                if label then
                    if distance < 5 and v.hide == false and GetPlayerServerId(PlayerId()) ~= v.source then
                        DrawText3D(vector3(x,y,z), label .. GetPlayerName(GetPlayerFromServerId(v.source)), Config.Tag.color.r, Config.Tag.color.g, Config.Tag.color.b)
                    end
                end
            end
        end
    end)
end
-------------- DrawText3D --------------
function DrawText3D(x,y,z, text, r,g,b) 
    local showing,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoords())
    local dist = #(vector3(px,py,pz)-vector3(x,y,z))

    local andaze = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local andaze = andaze*fov

    if showing then
        SetTextScale(0.0*andaze,Config.Size *andaze)
        SetTextFont(0)
        SetTextProportional(1)
        SetTextColour(r, g, b, 255)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x,_y)
    end
end