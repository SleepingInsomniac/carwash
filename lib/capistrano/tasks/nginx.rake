namespace :nginx do
  task :link do
    on roles(:app) do |host|
      execute "ln -f -s #{release_path}/config/nginx-#{fetch :stage}.conf /etc/nginx/sites-enabled/#{fetch :application}-#{fetch :stage}.conf"
    end
  end
end

after 'deploy:updated', 'nginx:link'
