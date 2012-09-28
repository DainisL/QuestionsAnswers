# RVM bootstrap
require "bundler/capistrano"
$:.unshift(File.expand_path("~/.rvm/lib"))
require "rvm/capistrano"
set :rvm_ruby_string, '1.9.3'
set :rvm_type, :user
set :stages, %w(production staging)
set :default_stage, "production"
require 'capistrano/ext/multistage'

# main details

server "ec2-54-247-62-185.eu-west-1.compute.amazonaws.com", :web, :app, :db, primary: true    
set :application, "QuestionsAnswers"
set :user, "ubuntu"
set :deploy_via, :remote_cache
set :use_sudo, false
set :scm, "git"
set :repository, "git@github.com:DainisL/QuestionsAnswers.git"
set :deploy_to, "/home/ubuntu/www/QuestionsAnswers"

default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :branch, "master"

after "deploy", "deploy:cleanup" # keep only the last 5 releases

namespace :deploy do

  %w[start stop].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/#{stage}-#{application} #{command}"
    end
  end
  #This is needed due strange unicorn shellscript bug, which is not restarting
  %w[restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do
      run "/etc/init.d/#{stage}-#{application} stop"
      sleep 5
      run "/etc/init.d/#{stage}-#{application} start"
    end
  end
  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/#{stage}-#{application}.conf /etc/nginx/sites-enabled/#{stage}-#{application}"
    sudo "ln -nfs #{current_path}/config/#{stage}-#{application}.sh /etc/init.d/#{stage}-#{application}"
    run "mkdir -p #{shared_path}/config"
  end
  after "deploy:setup", "deploy:setup_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/#{branch}`
      puts "WARNING: HEAD is not the same as origin/#{branch}"
      puts "Run `git push` to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"

  
end
after 'deploy:update_code', 'bundler:symlink_bundled_gems'
after 'deploy:update_code', 'bundler:install'