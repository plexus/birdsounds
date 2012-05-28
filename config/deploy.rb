require "bundler/capistrano"

set :application, "Birdsounds"

set :repository,  "rendaogit@git.rendaosolutions.org:rails/birdsounds.git"
set :scm, :git

# User credentials
ssh_options[:user] = "ubuntu"
ssh_options[:keys] = ["#{ENV['HOME']}/ec2/aws-eu-rds-1.pem"]
set :use_sudo, false

# RVM
set :rvm_ruby_string, 'ruby-1.9.3-p194@birdsounds'
set :rvm_type, :system 
before 'deploy:setup', 'rvm:create_gemset' # only create gemset
set :bundle_dir, ''

set :location, "ubuntu@ec2-46-137-49-69.eu-west-1.compute.amazonaws.com"

role :web, location  # Your HTTP server, Apache/etc
role :app, location  # This may be the same as your `Web` server
role :db,  location, :primary => true # This is where Rails migrations will run

require "rvm/capistrano"          


# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"


# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
