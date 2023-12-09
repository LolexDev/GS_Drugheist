fx_version "adamant"
game "gta5"
lua54 'yes'

author 'Lolex (GROVE SCRIPTS), Windows 10(GROVE SCRIPTS)'

client_scripts {
    "client/main.lua",
}

server_scripts {
    "server/main.lua",
}

shared_scripts {
    'config.lua',
    '@es_extended/imports.lua',
    '@es_extended/locale.lua',
    'locales/*.lua',
    'lib/functions.lua',
    '@ox_lib/init.lua',
}