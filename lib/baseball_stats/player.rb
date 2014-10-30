require 'baseball_stats/database'

module BaseballStats
  @connection = Database.connection

  class Player < ::ActiveRecord::Base
    self.table_name = 'players'

    def name
      "#{self.first_name} #{self.last_name}"
    end
  end
end
