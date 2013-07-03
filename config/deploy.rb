require 'capistrano/ext/multistage'

set :application, "russedge"
set :scm, :git
set :repository, "git@github.com:russ1985/russedge.git"
set :scm_passphrase, ""
set :user, "root"
set :stages, ["production"]
set :default_stage, "production"
set :rvm_ruby_string, :local
set :bundle_dir, ''
set :bundle_flags, '--system --quiet'

namespace :deploy do
  task :restart, :roles => :web do
    run "touch #{ current_path }/tmp/restart.txt"
  end
end
