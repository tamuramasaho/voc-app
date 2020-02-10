# config valid for current version and patch releases of Capistrano
lock "~> 3.11.2"

set :application, "voc-app"
set :repo_url, "git@github.com:tamuramasaho/voc-app.git"

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :rvm_ruby_version, '2.5.1'
set :passenger_restart_with_touch, true