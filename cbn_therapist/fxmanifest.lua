
fx_version 'adamant'
author 'C3bin'
description 'Therapist script made on a stress system!'
game 'gta5'
version '1.0.0'

lua54 'yes'

shared_script {
  '@ox_lib/init.lua',
  '@es_extended/imports.lua'
}

client_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/cs.lua',
  'config.lua',
  'client/cl_client.lua',
  'client/cl_blips.lua',
  'shared/sh_event.lua'
  
}

server_scripts {
  '@es_extended/locale.lua',
  'locales/en.lua',
  'locales/cs.lua',
  'config.lua',
  'server/sv_server.lua'
}

dependencies {
  'ox_lib' 
}
