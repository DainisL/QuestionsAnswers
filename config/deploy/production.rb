set :branch, "master"
set :rails_env,   "production"
set :unicorn_env, "production"
set :app_env,     "production"
set :deploy_to, "/home/#{user}/www/#{application}/production"