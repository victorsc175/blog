# require 'dotenv'
# require 'dotenv-rails'
# Dotenv.load('.env.local')

workers Integer(ENV.fetch("WEB_CONCURRENCY", 8))
threads_count = Integer(ENV.fetch("MAX_THREADS", 1))
threads(threads_count, threads_count)

preload_app!

rackup DefaultRackup
port 8082
environment 'production'

on_worker_boot do
  ActiveRecord::Base.establish_connection
end
