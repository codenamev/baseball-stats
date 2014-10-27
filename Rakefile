#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'active_record'
require 'baseball_stats/database'

Dir[File.join(File.dirname(__FILE__),'lib/tasks/*.rake')].each { |f| load f }

include ActiveRecord::Tasks

db_dir = File.expand_path '../db', __FILE__

DatabaseTasks.env = ENV['APP_ENV'] ||= 'development'
DatabaseTasks.db_dir = db_dir
DatabaseTasks.database_configuration = YAML::load(IO.read('config/database.yml'))
DatabaseTasks.migrations_paths = File.join(db_dir, 'migrate')

RSpec::Core::RakeTask.new(:spec)

task :environment do
  ActiveRecord::Base.configurations = DatabaseTasks.config
  ActiveRecord::Base.establish_connection DatabaseTasks.env
end

task :default => [:spec]

load 'active_record/railties/databases.rake'
