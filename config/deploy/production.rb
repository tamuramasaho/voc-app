server '18.180.8.25', user: 'masaho', roles: %w{app db web}

set :ssh_options, keys: '~/.ssh/voc-app_key_rsa'