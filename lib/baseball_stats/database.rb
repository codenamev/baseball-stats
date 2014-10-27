require 'rubygems'
require 'active_record'
require 'sqlite3'
require 'logger'
require 'yaml'

module BaseballStats::Database
  @env              = nil
  @logger           = nil
  @config           = {}
  @connection       = nil
  @root_path        = nil
  @db_dir           = nil
  @migrations_paths = nil

  extend self

  def connection
    @env             = ENV['APP_ENV'] ||= 'development'
    @config          = YAML::load(IO.read('config/database.yml'))
    @root_path       = File.expand_path '../../..', __FILE__
    @db_dir          = File.join @root_path, 'db'
    @migration_paths = [File.join(@root_path, 'db/migrate')]

    ::ActiveRecord::Base.logger = Logger.new("log/#{@env}.log")
    ::ActiveRecord::Base.establish_connection(@config[@env])
  end
end
