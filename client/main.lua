--[[------------------------------------------------------
----        For Support - discord.gg/YzC4Du7WYm       ----
----       Docs - https://docs.threeamigos.shop       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------
---@diagnostic disable: param-type-mismatch
--#region Variables
local isTackling = false
local gettingTackled = false
--#endregion

--#region Functions
--- Blocks actions. 
---@param status boolean
local function blockActions(status)
    if GetResourceState("npwd") == "started" then
        exports.npwd:setPhoneDisabled(status)
    end

    if GetResourceState("ox_target") == "started" then
        exports.ox_target:disableTargeting(status)
    end

    if GetResourceState("ox_inventory") == "started" then
        LocalPlayer.state.invBusy = status
    end
end

---Tackles the closest player.
local function tacklePlayer()
    if isTackling or gettingTackled then return end
    local ped = cache.ped
    if IsPedSwimming(ped) then return end
    local pedPos = GetEntityCoords(ped)
    local targetPlayer, targetPed, _ = lib.getClosestPlayer(pedPos, Config.distance)
    if cache.seat or IsPedInAnyVehicle(targetPed, false) then return end

    if not targetPlayer or not targetPed then return end

    if IsPedRagdoll(cache.ped) or IsPedRagdoll(targetPed) then return end

    lib.requestAnimDict(Config.animation.tacklerDict, Config.animation.timeout)

    if IsEntityPlayingAnim(ped, Config.animation.dict, Config.animation.clip, 3) then
        ClearPedSecondaryTask(ped)
    end
    blockActions(true)
    isTackling = true

    lib.playAnim(ped, Config.animation.tacklerDict, Config.animation.tacklerClip)
    AttachEntityToEntity(ped, targetPed, 11816, 0.25, 0.5, 0.0, 0.5, 0.5, 180.0, false, false, false, false, 2, false)
    TriggerServerEvent("TAM_Tackle:tacklePlayer", GetPlayerServerId(targetPlayer))

    Wait(3000)

    ClearPedSecondaryTask(ped)
    ClearPedTasks(ped)
    DetachEntity(ped, true, false)
    blockActions(false)

    lib.timer(Config.cooldown, function()
        isTackling = false
    end, true)
end

--- Tackled function.
local function getTackled()
    gettingTackled = true
    if Config.notify then
        lib.notify({description = locale("notify_tackled"), duration = 5000, type = "info"})
    end
    lib.playAnim(cache.ped, Config.animation.tackleeDict, Config.animation.tackleeClip)
    blockActions(true)
    SetPedToRagdoll(cache.ped, Config.ragdollDuration, config.ragdollDuration, 0, 0, 0, 0)

    Wait(Config.ragdollDuration)
    blockActions(false)
    gettingTackled = false
end
--#endregion

--#region Interactions
if Config.keybind.enabled then
    lib.addKeybind({
        name = "tackle",
        description = locale("keybind_description"),
        defaultKey = Config.keybind.defaultKey,
        defaultMapper = Config.keybind.defaultMapper,
        secondaryKey = Config.keybind.secondaryKey,
        secondaryMapper = Config.keybind.secondaryMapper,
        onReleased = function()
            tacklePlayer()
        end
    })
end

if Config.command then
    RegisterCommand(locale("command_name"), function()
        tacklePlayer()
    end)
    TriggerEvent("chat:addSuggestion", "/" .. locale("command_name"), locale("command_help"))
end

RegisterNetEvent("TAM_Tackle:getTackled", function()
    getTackled()
end)

if Config.target.enabled then
    exports.ox_target:AddGlobalPlayer({
        label = locale("target_label"),
        icon = Config.target.icon,
        distance = Config.target.distance,
        onSelect = function ()
            tacklePlayer()
        end
    })
end
--#endregion