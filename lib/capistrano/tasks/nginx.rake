set :home_path, File.expand_path("../../../../config/deploy", __FILE__)
set :nginx_conf_file, "#{fetch(:home_path)}/nginx.conf"

namespace :nginx do
  desc 'restart nginx'
  task :restart do
    on roles(:app) do
      execute :sudo, "service nginx restart"
    end
  end

  desc "create #{fetch(:application)} nginx.conf"
  task :generate_nginx_conf do
    on roles(:app) do
      info "creating #{fetch(:application)} nginx.conf file"
      open(fetch(:nginx_conf_file), 'w') do |f|
        f.puts(ERB.new(File.read(fetch(:home_path) + "/templates/nginx.conf.erb")).result(binding))
      end
    end
  end

  desc "upload #{fetch(:application)} nginx.conf"
  task :upload do
    on roles(:app) do
      upload!(fetch(:nginx_conf_file), "#{current_path}/config")
    end
  end

  desc "delete local #{fetch(:application)} nginx.conf"
  task :remove do
    on roles(:app) do
      FileUtils.rm(fetch(:nginx_conf_file))
    end
  end

  desc "create symlink for #{fetch(:application)} nginx.conf"
  task :create_symlink do
    on roles(:app) do
      execute :sudo, "ln -s #{current_path}}/config/nginx.conf /etc/nginx/sites-enabled/#{fetch(:application)}"
    end
  end

  desc "add nginx config to #{fetch(:application)}"
  task :create_nginx_config do
    on roles(:app) do |host|
      info "Creating #{fetch(:application)} nginx.conf"
      invoke 'nginx:generate_nginx_conf'
      invoke 'nginx:upload'
      invoke 'nginx:create_symlink'
      invoke 'nginx:remove'
    end
  end

end