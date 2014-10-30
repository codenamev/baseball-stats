require 'rubygems'
require 'active_record'
require 'sqlite3'
require 'logger'
require 'yaml'

module BaseballStats
  module Database
    include ActiveRecord::Tasks

    DEFAULT_ENV = "development".freeze

    @env              = nil
    @logger           = nil
    @connection       = nil
    @configuration    = YAML::load(IO.read('db/config.yml')).freeze
    @root_path        = File.expand_path('../../..', __FILE__).freeze
    @db_dir           = File.join(@root_path, 'db').freeze
    @migrations_paths = [File.join(@root_path, 'db/migrate')].freeze

    attr_accessor :configuration, :db_dir, :migrations_paths

    extend self

    def env
      @env = ENV['APP_ENV'] || DEFAULT_ENV
    end

    def connection
      ::ActiveRecord::Base.logger = Logger.new("log/#{self.env}.log")
      ::ActiveRecord::Base.establish_connection(configuration[self.env])
    end
  end
end
