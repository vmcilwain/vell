# Capistrano file for setting up delayed job during application deployment
set :home_path, File.expand_path("../../../../config/deploy", __FILE__)
set :delayed_job_init_file, "#{fetch(:home_path)}/delayed_job_init.sh"
set :delayed_job_binary, "#{fetch(:home_path)}/../../bin/delayed_job"
set :monit_conf_file, "#{fetch(:home_path)}/monit.conf"

namespace :delayed_job do

  def args
    fetch(:delayed_job_args, "")
  end

  def delayed_job_roles
    fetch(:delayed_job_server_role, :app)
  end

  desc 'Stop the delayed_job process'
  task :stop do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :'bin/delayed_job', :stop
        end
      end
    end
  end

  desc 'Start the delayed_job process'
  task :start do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :bundle, :exec, :'bin/delayed_job', args, :start
        end
      end
    end
  end

  desc 'Restart the delayed_job process'
  task :restart do
    on roles(:app) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          # execute :bundle, :exec, :'bin/delayed_job', args, :restart
          execute :sudo, "/etc/init.d/#{fetch(:application)}_delayed_job restart"
          invoke 'unicorn:autostart'
        end
      end
    end
  end
  
  desc 'set auto-start for delayed_job'
  task :autostart do
    on roles(:app) do
      info 'Setting delayed_job autostart in rc.*'
       execute 'sudo update-rc.d online_community_delayed_job defaults'
    end
  end
  
  desc "generate delayed_job_init.sh for #{fetch(:application)}"
  task :generate_delayed_job_init do
     on roles(:app) do
     info "generating #{fetch(:application)} delayed_job_init.sh file"
      open(fetch(:delayed_job_init_file), 'w') do |f|
        f.puts(ERB.new(File.read(fetch(:home_path) + "/templates/delayed_job_init.sh.erb")).result(binding))
      end
    end
  end
  
  desc "upload #{fetch(:application)} delayed_job_init.sh"
  task :upload_delayed_job_init do
    on roles(:app) do
      upload!(fetch(:delayed_job_init_file), "#{current_path}/config")
    end
  end
  
  desc "remove symlink for #{fetch(:application)} delayed_job_init.sh"
  task :remove_symlink do
    on roles(:app) do
      info 'Removing delayed_job_init.sh symlink'
      execute :sudo, "rm -rf /etc/init.d/#{fetch(:application)}_delayed_job"
    end
  end
  
  desc "create symlink for #{fetch(:application)} delayed_job_init.sh"
  task :create_symlink do
    on roles(:app) do
      info 'Symlinking delayed_job_init.sh'
      execute :sudo, "chmod +x #{current_path}/config/delayed_job_init.sh"
      execute :sudo, "ln -s #{current_path}/config/delayed_job_init.sh /etc/init.d/#{fetch(:application)}_delayed_job"
    end
  end
  
  desc "delete local #{fetch(:application)} delayed_job_init.sh"
  task :remove_delayed_job_init do
    on roles(:app) do
      info 'Deleting local delayed_job_init.sh'
      FileUtils.rm(fetch(:delayed_job_init_file))
    end
  end
  
  desc "add delayed_job to #{fetch(:application)} mmonit.conf"
    task :update_monit_conf do
      on roles(:app) do
        info "Adding delayed job config to monit.conf"
        open(fetch(:monit_conf_file), 'a') do |f|
          f.puts(ERB.new(File.read(fetch(:home_path) + "/templates/delayed_job_monit.conf.erb"), nil, '-').result(binding))
        end
      end
    end
  
  desc "add delayed_job init config to #{fetch(:application)}"
  task :create_delayed_job_init do
    on roles(:app) do |host|
      invoke 'delayed_job:generate_delayed_job_init'
      invoke 'delayed_job:upload_delayed_job_init'
      invoke 'delayed_job:remove_symlink'
      invoke 'delayed_job:create_symlink'
      invoke 'delayed_job:remove_delayed_job_init'
    end
  end
end