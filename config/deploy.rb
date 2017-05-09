# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "carwash"
set :repo_url, "git@git.pixelfaucet.com:alex/carwash.git"
set :deploy_to, "/var/www/carwash"
append :linked_files, "config/database.yml", "config/secrets.yml", 'config/cable.yml', 'db/production.sqlite3', "config/nginx-#{fetch(:stage)}.conf"
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", 'public/uploads', 'public/files'
set :passenger_restart_with_touch, true