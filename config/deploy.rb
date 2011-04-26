# require "bundler/capistrano"

set :application, "flashcard"
set :local_repository, "git@ramencereal.com:/home/git/flashcard"
set :repository, "file:///home/git/flashcard"
# set :repository,  "ssh://git@ramencereal.com/home/git/flashcard"

set :scm, :git
set :scm_username, "git"
set :user, "nishiki"
set :use_sudo, false

set :rake, "/opt/ruby-enterprise-1.8.7-2010.02/bin/rake"

role :web, "ramencereal.com"                          # Your HTTP server, Apache/etc
role :app, "ramencereal.com"                          # This may be the same as your `Web` server
role :db,  "ramencereal.com", :primary => true # This is where Rails migrations will run

set :deploy_to, "/home/nishiki/www/flashcard"

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end