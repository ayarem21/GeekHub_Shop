lock '3.11.2'

set :application, 'online_store'
set :repo_url, 'https://github.com/ayarem21/GeekHub_Shop.git'
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :user, 'deployer'
server '167.71.62.165', user: "#{fetch(:user)}", roles: %w{app db web}, primary: true
set :deploy_to,       "/home/#{fetch(:user)}/apps/#{fetch(:application)}"
set :pty, true

set :rvm_ruby_version, '2.6.3'

append :linked_files, 'config/database.yml', 'config/secrets.yml', 'config/puma.rb'
append :linked_dirs, 'log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads'

set :config_example_suffix, '.example'
set :config_files, %w{config/database.yml config/secrets.yml}
set :puma_conf, "#{shared_path}/config/puma.rb"

namespace :deploy do
  before 'check:linked_files', 'config:push'
  before 'check:linked_files', 'puma:jungle:setup'
  before 'check:linked_files', 'puma:nginx_config'
  after 'puma:smart_restart', 'nginx:restart'
end