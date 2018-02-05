require 'dotenv/capistrano'

# config valid for current version and patch releases of Capistrano
lock '~> 3.10.1'

set :application, 'blog'
set :repo_url, 'git@github.com:victorsc175/blog.git'

server '185.67.3.54', roles: %w(app db)
set :ssh_options, user: 'victor'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set :branch, `git rev-parse --abbrev-ref HEAD`.chomp
set(:branch, ENV['BRANCH']) if ENV['BRANCH'] 

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, "/var/www/my_app_name"
set :deploy_to, "/home/victor/www/blog"

set :bundle_jobs, 4
set :format, :pretty
set :log_level, :debug
set :pty, true
append :linked_dirs, 'log', 'tmp/pids', 'sockets', 'public/static'
set :rvm_type, :user
set :rvm_ruby_version, '2.4.1'
set :default_env, rails_env: fetch(:stage)

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# append :linked_files, "config/database.yml", "config/secrets.yml"

# Default value for linked_dirs is []
# append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure
