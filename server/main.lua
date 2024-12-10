--[[------------------------------------------------------
----        For Support - discord.gg/YzC4Du7WYm       ----
----       Docs - https://docs.threeamigos.shop       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------
RegisterNetEvent("TAM_Tackle:tacklePlayer", function(targetPlayer)
    local ped = GetPlayerPed(source)
    local pedPos = GetEntityCoords(ped)
    local targetPed = GetPlayerPed(targetPlayer)
    local targetPos = GetEntityCoords(targetPed)

    if #(pedPos - targetPos) > Config.distance then return end

    TriggerClientEvent("TAM_Tackle:getTackled", targetPlayer)
end)

if not Config.versionCheck then return end
lib.versionCheck("threeamigosmodding/TAM_Tackle")