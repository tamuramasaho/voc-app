server '18.178.70.215', user: 'masaho', roles: %w{app db web}

set :ssh_options, keys: '~/.ssh/capistrano_key_rsa'