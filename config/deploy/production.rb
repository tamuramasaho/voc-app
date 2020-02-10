role :app, %w{deploy_user@3.113.137.46}
role :web, %w{deploy_user@3.113.137.46}
role :db,  %w{deploy_user@3.113.137.46}
set :ssh_options, {
   keys: %w('/Users/user/Desktop/my-key.pem'),
   forward_agent: false,
   auth_methods: %w(publickey password)
}