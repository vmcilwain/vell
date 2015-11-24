# Monit file for setting up monit during application deployment
set :home_path, File.expand_path("../../../../config/deploy", __FILE__)
set :monit_conf_file, "#{fetch(:home_path)}/monit.conf"

namespace :monit do

  desc 'creation of monit file for application'
  task :write_monit_conf do
    on roles(:app) do
      info "Creating monit config"
      `touch #{fetch(:monit_conf_file)}`
      invoke 'unicorn:update_monit_conf'
    end
  end

  desc 'restart monit appliation'
  task :reload do
    on roles(:app) do
      info 'Reloading initialize monit'
      execute 'sudo monit reload' # re-read /etc/monitrc
    end
  end

  desc 'upload monit config to app'
  task :upload do
    on roles(:app) do
      upload!(fetch(:monit_conf_file), "#{current_path}/config")
    end
  end

  desc 'remove temp file'
  task :remove do
    on roles(:app) do
      FileUtils.rm(fetch(:monit_conf_file))
    end
  end

  desc 'start creation of monit file for application'
  task :create_monit_conf do
    on roles(:app) do
      info "Creating #{fetch(:application)} config/monit.config"
      invoke 'monit:write_monit_conf'
      invoke 'monit:upload'
      invoke 'monit:remove'
      invoke 'monit:reload'
    end
  end
end