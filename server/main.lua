ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
---------- Setting ----------
local Admininfo     = {}

---------- Info ----------
RegisterCommand('info', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local Name = xPlayer.getName()
    local SteamN = GetPlayerName(source)
    local Job = xPlayer.job.name
    local JobG = xPlayer.job.grade
    local Cash = xPlayer.getAccount('money')
    local Bank = xPlayer.getAccount('bank')
    TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, "\nName : "..Name.."\nSteam Name: "..SteamN.."\nJob : "..Job.."\nCash: "..Cash.."\nBank: "..Bank.."\nJob Grade : "..JobG.."")
end)

---------- Get Info ----------
RegisterCommand('getinfo', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
            local Name = xPlayer.getName()
            local SteamN = GetPlayerName(source)
            local Job = xTarget.job.name
            local JobG = xTarget.job.grade
            local Cash = xTarget.getAccount('money')
            local Bank = xTarget.getAccount('bank')
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, "\nName : "..Name.."\nSteam Name: "..SteamN.."\nJob : "..Job.."\nCash: "..Cash.."\nBank: "..Bank.."\nJob Grade : "..JobG.."")
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_duty'))
            end
        else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Admin ----------
RegisterCommand('admin', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local Group = xPlayer.getGroup()
    TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, "Your Group : ^2"..Group.."")
end)

---------- TPM ----------
RegisterCommand('tpm', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            TriggerClientEvent('esx_adminduty:tpm', source)
            else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_duty'))
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Announce ----------
RegisterCommand('announce', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if tonumber(args[1]) == nil or tonumber(args[1]) == "" then
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            else
                local message = table.concat(args, " ", 2)
                TriggerClientEvent('chat:addMessage', -1, {
                    template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color:red; border-radius: 13px;"><i class="far fa-newspaper"></i> Announce <br>  {1}</div>',
                    args = {"Console", message}
                })
            end
        else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_duty'))
        end
        else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)


---------- Bring ----------
RegisterCommand('bring',function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] and tonumber(args[1])then
                local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
                if xTarget then
                    local xPlayerCoords = xPlayer.getCoords()
                    xTarget.setCoords(xPlayerCoords)
                else
                    TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_avalble'))
                end
                else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            end
        else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_duty'))
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- GOTO ----------
RegisterCommand('goto', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] and tonumber(args[1])then
                local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
                if xTarget then
                    local xTargetCoords = xTarget.getCoords()
                    xPlayer.setCoords(xTargetCoords)
                else
                    TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_avalble'))
                end
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            end
        else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_duty'))
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Slay ----------
RegisterCommand('slay', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] and tonumber(args[1]) then
                local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
                if xTarget then
                    TriggerClientEvent('esx_adminduty:slay', xTarget.source)
                else
                    TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_avalble'))
                end
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            end
        else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_duty'))
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Freeze ----------
RegisterCommand('freeze', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] and tonumber(args[1]) then
                local xTarget = ESX.GetPlayerFromId(source)
                if xTarget then
                    TriggerClientEvent('esx_adminduty:freeze', xTarget.source)
                else
                    TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
                end
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            end
        else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_duty'))
        end
        else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- UnFreeze ----------
RegisterCommand('unfreeze', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] and tonumber(args[1]) then
                local xTarget = ESX.GetPlayerFromId(source)
                if xTarget then
                    TriggerClientEvent('esx_adminduty:unfreeze', xTarget.source)
                else
                    TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
                end
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            end
        else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_duty'))
        end
        else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- KICK ----------
RegisterCommand('kick', function(source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] and args[2] then
                if args[1] == source then
                    TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"kick_self")
                end
                local xTarget = args[1]
                local SName = GetPlayerName(source)
                local Tname = GetPlayerName(xTarget)
                local Resson = args[2]
                DropPlayer(xTarget, "\nYou Are Kick From Server\nAdmin : "..GetPlayerName(source).."("..source..")\nResson: "..args[2]"")
                KickLog(SName, Tname, Resson)
                else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            end
            else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_duty'))
        end
        else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Remove Weapon ----------
RegisterCommand('removeweapon', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] and tonumber(args[1]) then
                local xTarget = args[1]
                TriggerClientEvent('esx_adminduty:RemoveAllWeapon', xTarget)
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            end
            else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_duty'))
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Aduty ----------
RegisterCommand('aduty', function (source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            xPlayer.set('duty', false)
            local name = GetPlayerName(source)
            local group = xPlayer.getGroup()
            Admininfo[source] = nil
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"off_duty")
            TriggerClientEvent('esx_adminduty:GetTagData', -1, Admininfo)
            TriggerClientEvent('esx_adminduty:ChangeTagOwn', source, false)
            TriggerClientEvent('esx_adminduty:DutyMe', source, false)
            TriggerClientEvent('esx_adminduty:AddCommandSuggestion', source)
            OnDutyLog(name, group)
        else
            xPlayer.set('duty', true)
            local name = GetPlayerName(source)
            local group = xPlayer.getGroup()
            Admininfo[source] = {src = source, group = xPlayer.getGroup(), hide = false}
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"on_duty")
            TriggerClientEvent('esx_adminduty:GetTagData', -1, Admininfo)
            TriggerClientEvent('esx_adminduty:ChangeTagOwn', source, true)
            TriggerClientEvent('esx_adminduty:DutyMe', source, true)
            TriggerClientEvent('esx_adminduty:RemoveCommandSuggestion', source)
            OffDutyLog(name, group)
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Change Ped ----------
RegisterCommand('changeped', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] then
                local ped = args[1]
                TriggerClientEvent('esx_adminduty:ChangePed', source, ped)
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('change_ped', args[1]))
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            end
        else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"not_duty")
        end
        else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Reset Ped ----------
RegisterCommand('resetped', function (source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            TriggerClientEvent('esx_adminduty:ResetPed', source)
        else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"not_duty")
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- SetArmor ----------
RegisterCommand('setarmor', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] and tonumber(args[1]) and args[2] and tonumber(args[2]) then
                TriggerClientEvent('esx_adminduty:SetArmor', tonumber(args[1], tonumber(args[2])))
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('add_armor',args[2], GetPlayerName(tonumber(args[1]))))
            end
            else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"not_duty")
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Heal ----------
RegisterCommand('heal', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] and tonumber(args[1]) then
                local SName = GetPlayerName(source)
                local TName = GetPlayerName(tonumber(args[1]))
                TriggerClientEvent('esx_adminduty:healplayer', tonumber(args[1]))
                HealLog(SName, TName)
            else
                local SName = GetPlayerName(source)
                TriggerClientEvent('esx_adminduty:healplayer', source)
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"self_heal")
                HealLog(SName, SName)
            end
        else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"not_duty")
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Revive ----------
RegisterCommand('revive', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] and tonumber(args[1]) then
                local SName = GetPlayerName(source)
                local TName = GetPlayerName(tonumber(args[1]))
                TriggerClientEvent('esx_ambulancejob:revive', tonumber(args[1]))
                ReviveLog(SName, TName)
            else
                local SName = GetPlayerName(source)
                TriggerClientEvent('esx_ambulancejob:revive', source)
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"self_revive")
                ReviveLog(SName, SName)
            end
        else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"not_duty")
        end
        else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- SetJob ----------
RegisterCommand('setjob', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] and args[2] and args[3] then
                local xTarget = ESX.GetPlayerFromId(args[1])
                local NowJob = xTarget.job.name
                local NowGrade = xTarget.job.grade
                local NewJob = args[2]
                local NewGrade = args[3]
                xTarget.setJob(args[2], args[3])
                local SName = GetPlayerName(source)
                local Tname = GetPlayerName(args[1])
                SetJobLog(SName, Tname, NowJob, NewJob, NowGrade, NewGrade)
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            end
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"on_duty")
            end
        else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Car ----------
RegisterCommand('car', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            TriggerClientEvent('esx_adminduty:SpawnVehicle', source, args[1])
        else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"not_duty")
        end
        else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Delete Vehicle ----------
RegisterCommand('dv', function (source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            TriggerClientEvent('esx_adminduty:DeleteVehicle', source)
            else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"not_duty")
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Set Money ----------
RegisterCommand('setmoney', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] and args[2] and args[3] then
                local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
                local SName = GetPlayerName(source)
                local TName = GetPlayerName(tonumber(args[1]))
                local Type = args[2]
                local Ammount = args[3]
                SetMoneyLog(SName, TName, Type, Ammount)
                if args[2] == "cash" then
                    xTarget.addMoney(tonumber(args[3]))
                end
                if args[2] == "bank" then
                    xTarget.addAccountMoney('bank', tonumber(args[1]))
                end
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            end
        else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"not_duty")
        end
        else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Give Iteam ----------
RegisterCommand('giveitem', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if tonumber(args[1]) and args[2] and tonumber(args[3]) then
                local target = tonumber(args[1])
                local xTarget = ESX.GetPlayerFromId(target)
                if xTarget then
                    xTarget.addInventoryItem(args[2], tonumber(args[3]))
                else
                    TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_avalble'))
                end
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            end
        else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"not_duty")
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Give Weapon ----------
RegisterCommand('giveweapon', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if tonumber(args[1]) and args[2] and tonumber(args[3]) then
                local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
                    if xTarget then
                        xTarget.addWeapon(args[2], tonumber(args[3]))
                            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('give_weapon', args[2], GetPlayerName(tonumber(args[1]))))
                        else
                        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_avalble'))
                    end
                    else
                    TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
                end
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"on_duty")
            end
        else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Clear Inventory ----------
RegisterCommand('clearinventory', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if tonumber(args[1]) then
                local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
                if xTarget then
                    for k, v in ipairs(xTarget.Inventory) do
                        if v.count > 0 then
                            xTarget.setInventoryItem(v.name, 0)
                            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('clear_inventory', GetPlayerName(xTarget)))
                        end
                    end
                    else
                    TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_avalble'))
                end
                else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            end
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"on_duty")
            end
        else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)
---------- Clear Load Out ----------
RegisterCommand('clearloadout', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if tonumber(args[1]) then
                local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
                for k, v in ipairs(xTarget.loadout) do
                    xTarget.removeweapon(v.name)
                    TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('clear_loadout', GetPlayerName(xTarget)))
                end
                else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_avalble'))
            end
            else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"not_duty")
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Set Group ----------
RegisterCommand('setgroup', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    local SName = GetPlayerName(source)
    local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
    local LRank = xPlayer.getGroup() 
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if tonumber(args[1]) and args[2] then
                local TName = GetPlayerName(tonumber(args[1]))
                local rank = table.concat(args, " ", 3)
                local NRank = rank
                xTarget.setGroup(rank)
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('set_group', GetPlayerName(xTarget), args[3]))
                SetGroupLog(SName, TName, LRank, NRank)
                else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            end
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"on_duty")
            end
        else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)
---------- Save ----------
RegisterCommand('save', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] then
            local xTarget = ESX.GetPlayerFromId(tonumber(args[1]))
            ESX.SavePlayer(xTarget)
            else
                TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_args'))
            end
            else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"not_duty")
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Save All ----------
RegisterCommand('saveall', function (source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            ESX.SavePlayers()
            else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"not_duty")
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Noclip ----------
RegisterCommand('noclip', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            TriggerClientEvent("esx_adminduty:noclip", source)
            else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"not_duty")
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)

---------- Fix  ----------
RegisterCommand('fix', function (source, args)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer.getGroup() == "admin" then
        if xPlayer.get('duty') then
            if args[1] then
                TriggerClientEvent("esx_adminduty:fix", source)
            else
                TriggerClientEvent("esx_adminduty:fix", tonumber(args[1]))
            end
            else
            TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U"not_duty")
        end
    else
        TriggerClientEvent('chatMessage', source, "[SYSTEM]", {255, 0, 0}, _U('not_admin'))
    end
end)
---------- Coords  ----------
RegisterNetEvent('esx_adminduty:coords')
AddEventHandler('esx_adminduty:coords', function (message)
    local s = source
    TriggerClientEvent('chatMessage', s, "[SYSTEM]", {255, 0, 0}, message)
    print(message)
    DevLog(message)
end)

--------- log function ---------
function OnDutyLog(name, prem)
    PerformHttpRequest(Config.Log.OnDuty, function(E, F, G)
    end, "POST", json.encode({
        embeds = {
            {
                author = {
                name = Config.Server.Name,
                url = Config.Server.Discord,
                icon_url = Config.Server.Logo
                },
                title = "Admin",
                description = "**Name:** "..name.."\n**Perm:** "..prem.."\n**Status:** On Duty\n**Time:** "..os.time().."",
                color = 3066993
            }
        }
    }), {
        ["Content-Type"] = "application/json"
    })
end

function OffDutyLog(name, prem)
    PerformHttpRequest(Config.Log.OffDuty, function(E, F, G)
    end, "POST", json.encode({
        embeds = {
            {
                author = {
                name = Config.Server.Name,
                url = Config.Server.Discord,
                icon_url = Config.Server.Logo
                },
                title = "Admin",
                description = "**Name:** "..name.."\n**Perm:** "..prem.."\n**Status:** Off Duty\n**Time:** "..os.time().."",
                color = 15158332
            }
        }
    }), {
        ["Content-Type"] = "application/json"
    })
end

function DevLog(text)
    PerformHttpRequest(Config.Log.DevTools, function(E, F, G)
    end, "POST", json.encode({
        embeds = {
            {
                author = {
                name = Config.Server.Name,
                url = Config.Server.Discord,
                icon_url = Config.Server.Logo
                },
                title = "Developer Log",
                description = "**"..text.."**",
                color = 16776960
            }
        }
    }), {
        ["Content-Type"] = "application/json"
    })
end

function KickLog(SName, Tname, Resson)
    PerformHttpRequest(Config.Log.Kick, function(E, F, G)
    end, "POST", json.encode({
        embeds = {
            {
                author = {
                name = Config.Server.Name,
                url = Config.Server.Discord,
                icon_url = Config.Server.Logo
                },
                title = "Kick Log",
                description = "**Kick By:** "..SName.."\n**Player Name:** "..Tname.."\n**Resson:** "..Resson.."",
                color = 16776960
            }
        }
    }), {
        ["Content-Type"] = "application/json"
    })
end

function HealLog(Name, Tname)
    PerformHttpRequest(Config.Log.Heal, function(E, F, G)
    end, "POST", json.encode({
        embeds = {
            {
                author = {
                name = Config.Server.Name,
                url = Config.Server.Discord,
                icon_url = Config.Server.Logo
                },
                title = "Heal Log",
                description = "**Heal By:** "..Name.."\n**Player Name:** "..Tname.."",
                color = 3066993
            }
        }
    }), {
        ["Content-Type"] = "application/json"
    })
end

function ReviveLog(Name, Tname)
    PerformHttpRequest(Config.Log.Revive, function(E, F, G)
    end, "POST", json.encode({
        embeds = {
            {
                author = {
                name = Config.Server.Name,
                url = Config.Server.Discord,
                icon_url = Config.Server.Logo
                },
                title = "Revive Log",
                description = "**Revive By:** "..Name.."\n**Player Name:** "..Tname.."",
                color = 3066993
            }
        }
    }), {
        ["Content-Type"] = "application/json"
    })
end

function SetJobLog(SName, Tname, NowJob, NewJob, NowGrade, NewGrade)
    PerformHttpRequest(Config.Log.SetJob, function(E, F, G)
    end, "POST", json.encode({
        embeds = {
            {
                author = {
                name = Config.Server.Name,
                url = Config.Server.Discord,
                icon_url = Config.Server.Logo
                },
                title = "Set Job Log",
                description = "**Setjob By:** "..SName.."\n**Player:** "..Tname.."\n**Player LastJob:** "..NowJob.."\n**Player Last Grade:** "..NowGrade.."\n**Player New Job:** "..NewJob.."\n**Player New Grade:** "..NewGrade.."",
                color = 2123412
            }
        }
    }), {
        ["Content-Type"] = "application/json"
    })
end

function SetMoneyLog(SName, TName, Type, Ammount)
    PerformHttpRequest(Config.Log.SetMoney, function(E, F, G)
    end, "POST", json.encode({
        embeds = {
            {
                author = {
                name = Config.Server.Name,
                url = Config.Server.Discord,
                icon_url = Config.Server.Logo
                },
                title = "Set Moeny Log",
                description = "**Set Money By:** "..SName.."\n**Player:** "..TName.."\n**Type:** "..Type.."\n**Ammount:** "..Ammount.."",
                color = 3066993
            }
        }
    }), {
        ["Content-Type"] = "application/json"
    })
end

function SetGroupLog(SName, TName, LRank, NRank)
    PerformHttpRequest(Config.Log.SetGroup, function(E, F, G)
    end, "POST", json.encode({
        embeds = {
            {
                author = {
                name = Config.Server.Name,
                url = Config.Server.Discord,
                icon_url = Config.Server.Logo
                },
                title = "Set Group Log",
                description = "**Set Group By:** "..SName.."\n**Player:** "..TName.."\n**Player Last Rank:** "..LRank.."\n**Player New Rank:** "..NRank.."",
                color = 15105570
            }
        }
    }), {
        ["Content-Type"] = "application/json"
    })
end

------------------------------
