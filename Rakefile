#!/usr/bin/env rake
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'active_record'
require 'active_record_migrations'
require 'baseball_stats/database'

Dir[File.join(File.dirname(__FILE__),'lib/tasks/*.rake')].each { |f| load f }

RSpec::Core::RakeTask.new(:spec)
ActiveRecordMigrations.load_tasks

task :environment do
  BaseballStats::Database.connection
end

task :default => [:spec]
