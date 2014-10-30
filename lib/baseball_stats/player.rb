require 'baseball_stats/database'

module BaseballStats
  @connection = Database.connection

  class Player < ::ActiveRecord::Base
    self.table_name = 'players'

    def name
      "#{self.first_name} #{self.last_name}"
    end

    def to_s
      self.name
    end
  end
end
