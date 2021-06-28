fx_version 'adamant'
game 'gta5'
author 'Admin Commands + Duty For ESX'
description 'esx_adminduty'
version '1.0.0'



client_scripts {
	'@es_extended/locale.lua',
	'client/main.lua',
	'locales/*.lua',
    'config.lua'
}

server_scripts {
    '@es_extended/locale.lua',
    'server/main.lua',
    'locales/*.lua',
    'config.lua'
}