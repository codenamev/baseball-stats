require 'baseball_stats/database'

module BaseballStats
  @connection = Database.connection

  class Batting < ::ActiveRecord::Base
    self.table_name = 'battings'
  end
end
