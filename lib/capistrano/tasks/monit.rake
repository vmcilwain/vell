# Capistrano file for setting up monit during application deployment
set :home_path, File.expand_path("../../../../config/deploy", __FILE__)
set :rails_config_dir, "/var/www/#{fetch(:application)}/current/config"
namespace :monit do

  def daemons
    capture("ls -1 #{current_path}/tmp/pids").split
  end

  desc 'creation of monit file for application'
  task :write_monit_conf do
    on roles(:app) do
      info "Creating monit config"
      open(fetch(:monit_conf_file), 'w') do |f|
        daemons.each do |daemon|
          f.puts(ERB.new(File.read(fetch(:home_path) + "/templates/monit.conf.erb"), nil, '-').result(binding))
        end
      end
    end
  end


  desc 'restart monit appliation'
  task :reload do
    on roles(:app) do
      info 'Reloading monit'
      execute 'monit reload'
    end
  end

  desc 'upload monit config to app'
  task :upload do
    on roles(:app) do
      upload!(fetch(:monit_conf_file), fetch(:rails_config_dir))
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
      info "Daemons Found: #{daemons.size}"
      if daemons.any?
        invoke 'monit:write_monit_conf'
        invoke 'monit:upload'
        invoke 'monit:remove'
        invoke 'monit:reload'
      end
    end
  end
end