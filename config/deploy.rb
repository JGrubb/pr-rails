set :application, "plantright"
set :repository,  "git@github.com:JGrubb/pr-rails.git"

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "plantright"                          # Your HTTP server, Apache/etc
role :app, "plantright"                          # This may be the same as your `Web` server
role :db,  "plantright", :primary => true # This is where Rails migrations will run

default_run_options[:pty] = true
set :user, "rubyuser"
ssh_options[:forward_agent] = true
set :use_sudo, false

after "deploy", "deploy:copydbyaml"

namespace :deploy do
  task :copydbyaml do
    run "cp #{shared_path}/database.yml #{current_path}/config/database.yml"
  end

  task :bundle_install do
    run "cd #{current_path} && bundle install"
  end
end
# if you want to clean up old releases on each deploy uncomment this:
after "deploy:restart", "deploy:cleanup"
before "deploy:assets:precompile", "deploy:bundle_install"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end
