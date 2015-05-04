# In order for this to work the following must be true
# * user must have sudo without password privileges for setting symlinks
# * local env for db password needs to be set in :default_env so that migrations can run

# To Dos
# * Figure out how to get capistrano-bundler to generate unicorn binary
# * 
# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'vell'
set :repo_url, 'git@github.com:vmcilwain/vell.git'

# Default branch is :master
ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/#{fetch(:application)}"

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
# set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5
# set :running_dir, File.dirname(__FILE__)
# set :whenever_identifier, ->{ "#{fetch(:application)}_#{fetch(:stage)}" }
# set :whenever_roles, ->{ :app }
# set :monit_conf_file, "#{fetch(:running_dir)}/deploy/monit.conf"
set :rails_env, fetch(:stage)
set :default_env, { 'DBPASS' => ENV['PROWEB'] }
set :bundle_binstubs, -> { release_path.join('bin') }
set :home_path, File.expand_path('/config',__FILE__)
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
      invoke 'unicorn:restart'
      invoke 'nginx:restart'
    end
  end
  
  task :upload_app_yml do
    on roles(:app) do
      info 'Uploading application.yml'
      info "#{Dir.pwd}"
      upload!("#{fetch(:home_path)}/application.yml", "#{current_path}/config")
    end
  end
  
  after :started, :upload_app_yml
  before :published, 'nginx:create_nginx_config'
  before :published, 'unicorn:create_unicorn_config'
  before :published,'unicorn:create_unicorn_init'
end
