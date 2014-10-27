require 'rubygems'
require 'active_record'
require 'sqlite3'

require "baseball_stats/batting"
require "baseball_stats/database"
require "baseball_stats/import"
require "baseball_stats/version"

module BaseballStats
  include Import
  include Database

  extend self
end
