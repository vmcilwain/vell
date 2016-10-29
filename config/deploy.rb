# In order for this to work the following must be true
# * user must have sudo without password privileges for setting symlinks
# * local env for db password needs to be set in :default_env so that migrations can run

# To Dos
# * Figure out how to get capistrano-bundler to generate unicorn binary
# *
# config valid only for current version of Capistrano
lock '3.6.1'

set :application, 'vell'
set :repo_url, 'git@github.com:vmcilwain/vell.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/#{fetch(:application)}"


# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
# set :whenever_roles, ->{ :app }
# set :monit_conf_file, "#{fetch(:running_dir)}/deploy/monit.conf"
set :rails_env, fetch(:stage)
set :bundle_binstubs, -> { release_path.join('bin') }
namespace :deploy do
  # after :restart, :clear_cache do
  #   on roles(:app), in: :groups, limit: 3, wait: 10 do
  #     # Here we can do anything such as:
  #     # within release_path do
  #     #   execute :rake, 'cache:clear'
  #     # end
  #   end
  # end

  before :finishing, :restart do
    on roles(:app) do
      execute :sudo, 'service elasticsearch restart'
      invoke 'unicorn:restart'
      invoke 'nginx:restart'
    end
  end

  task :upload_app_yml do
    on roles(:app) do
      info 'Uploading application.yml'
      upload!("#{Dir.pwd}/config/application.yml", "#{release_path}/config")
    end
  end

  before :compile_assets, :upload_app_yml
  before :published, 'nginx:create_nginx_config'
  before :published, 'unicorn:create_unicorn_config'
  before :published,'unicorn:create_unicorn_init'
  after :restart, 'monit:create_monit_conf'
end
