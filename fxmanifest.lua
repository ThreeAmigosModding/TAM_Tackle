--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
----       Docs - https://docs.threeamigos.shop       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

game "gta5"
lua54 "yes"
fx_version "cerulean"
use_experimental_fxv2_oal "yes"

name "TAM_Tackle"
author "ThreeAmigosModding"
description "Very simple tackle script w/ proper syncing & animations."
version "v1.0.0"

files {
    "data/**",
    "locales/*.json"
}

dependencies {
    "/server:9000",
    "/gameBuild:2802",
    "/onesync",
    "ox_lib",
}

shared_scripts {
    "@ox_lib/init.lua",
    "shared/main.lua"
}

client_scripts {
    "client/main.lua",
}

server_scripts {
    "server/main.lua"
}

escrow_ignore {
    "**/*.lua"
}