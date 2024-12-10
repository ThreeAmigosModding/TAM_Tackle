--[[------------------------------------------------------
----                   Configuration                  ----
----        For Support - discord.gg/YzC4Du7WY        ----
----       Docs - https://docs.threeamigos.shop       ----
--]]------------------------------------------------------
local config = {}

config.versionCheck = true -- Should we check for updates?

config.distance = 1.5 -- Tackle distance

config.cooldown = 5000 -- Time in milliseconds that we should cooldown for.

config.notify = true -- Should we notify when someone tackles you?

config.ragdollDuration = 5000 -- Time in milliseconds that a player should ragdoll for after being tackled.

config.keybind = {
    enabled = true, -- Should the keybind be enabled?
    defaultKey = "G", -- Default Key. Ref: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
    defaultMapper = 'KEYBOARD', -- Key Mapper ID. Ref: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
    secondaryKey = nil, -- If you want to specify a controller keybind. Ref: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
    secondaryMapper = nil, -- If you want to specify a controller keybind. Ref: https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/
}

config.command = true -- enable the command

config.target = {
    enabled = true, -- Should we enable tackling?
    icon = "fas fa-user-ninja", -- Target icon.
    distance = 2.0 -- Target interact distance.
}

config.animation = {
    timeout = 15000, -- timeout to load animation in ms
    tacklerDict = "missmic2ig_11", -- anim dict that the tackler will play
    tacklerClip = "mic_2_ig_11_intro_goon", -- anim clip that the tackler will play
    tackleeDict = "missmic2ig_11", -- anim dict that the tacklee will play
    tackleeClip = "mic_2_ig_11_intro_p_one", -- anim clip that the tacklee will play
}

return config