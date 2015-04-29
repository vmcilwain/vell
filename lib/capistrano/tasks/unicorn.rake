set :home_path, File.expand_path("../../../../config/deploy", __FILE__)
set :unicorn_conf_file, "#{fetch(:home_path)}/unicorn.conf"
set :unicorn_init_file, "#{fetch(:home_path)}/unicorn_init.sh"

namespace :unicorn do
  desc "restart unicorn for #{fetch(:application)}"
  task :restart do
    on roles(:app) do
      info 'Restarting unicorn'
      execute :sudo, "unicorn-#{fetch(:applicadtion)} restart"
    end
  end

  desc "generate unicorn.conf for #{fetch(:application)}"
  task :generate_unicorn_conf do
     on roles(:app) do
      info "generating #{fetch(:application)} unicorn.conf file"
      open(fetch(:unicorn_conf_file), 'w') do |f|
        f.puts(ERB.new(File.read(fetch(:home_path) + "/templates/unicorn.conf.erb")).result(binding))
      end
    end
  end

  desc "generate unicorn_init.sh for #{fetch(:application)}"
  task :generate_unicorn_init do
     on roles(:app) do
     info "generating #{fetch(:application)} unicorn_init.sh file"
      open(fetch(:unicorn_init_file), 'w') do |f|
        f.puts(ERB.new(File.read(fetch(:home_path) + "/templates/unicorn_init.sh.erb")).result(binding))
      end
    end
  end

  desc "upload #{fetch(:application)} unicorn.conf"
  task :upload_unicorn_conf do
    on roles(:app) do
      upload!(fetch(:unicorn_conf_file), "#{current_path}/config")
    end
  end

  desc "upload #{fetch(:application)} unicorn_init.sh"
  task :upload_unicorn_init do
    on roles(:app) do
      upload!(fetch(:unicorn_init_file), "#{current_path}/config")
    end
  end

  desc "delete local #{fetch(:application)} unicorn.conf"
  task :remove_unicorn_conf do
    on roles(:app) do
      info 'Deleting loacl unicorn.conf'
      FileUtils.rm(fetch(:unicorn_conf_file))
    end
  end

  desc "delete local #{fetch(:application)} unicorn.init.sh"
  task :remove_unicorn_init do
    on roles(:app) do
      info 'Deleting loacl unicorn_init.sh'
      FileUtils.rm(fetch(:unicorn_init_file))
    end
  end

  desc "create symlink for #{fetch(:application)} unicorn_init.sh"
  task :create_symlink do
    on roles(:app) do
      info 'Symlinking unicorn_init.sh'
      execute :sudo, "chmod +x #{current_path}/config/unicorn_init.sh"
      execute :sudo, "ln -s #{current_path}}/config/unicorn_init.sh /etc/init.d/unicorn-#{fetch(:application)}"
    end
  end

  desc "remove symlink for #{fetch(:application)} unicorn_init.sh"
  task :remove_symlink do
    on roles(:app) do
      info 'Removing unicorn_init.sh symlink'
      execute :sudo, "rm -rf /etc/init.d/unicorn-#{fetch(:application)}"
    end
  end

  desc "add unicorn config to #{fetch(:application)}"
  task :create_unicorn_config do
    on roles(:app) do |host|
      invoke 'unicorn:generate_unicorn_conf'
      invoke 'unicorn:upload_unicorn_conf'
      invoke 'unicorn:remove_unicorn_conf'
    end
  end

  desc "add unicorn init config to #{fetch(:application)}"
  task :create_unicorn_init do
    on roles(:app) do |host|
      invoke 'unicorn:generate_unicorn_init'
      invoke 'unicorn:upload_unicorn_init'
      invoke 'unicorn:remove_symlink'
      invoke 'unicorn:create_symlink'
      invoke 'unicorn:remove_unicorn_init'
    end
  end
end