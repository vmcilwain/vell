namespace :rails_db do
  desc "check if db exists on remote server. If not create it."
  task :check_db_existance do
    on roles(:app) do
      execute "mysql -u rails_user -p#{capture("echo $DBPASS").chomp} -e \"CREATE DATABASE IF NOT EXISTS #{fetch(:application)}_#{fetch(:stage)}\""
    end
  end
end