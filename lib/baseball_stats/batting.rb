require 'baseball_stats/database'

module BaseballStats
  @connection = Database.connection

  class Batting < ::ActiveRecord::Base
    self.table_name = 'battings'

    belongs_to :player, primary_key: :player_id
    delegate :name, to: :player, prefix: true, allow_nil: true

    scope :tripple_crown_eligible,   -> { where('battings.at_bats >= 400') }
    scope :with_batting_average,     -> { select('battings.*, ((battings.hits * 1.0) / battings.at_bats) AS batting_average') }
    scope :with_slugging_percentage, -> { select('battings.*, ((((battings.hits - battings.doubles - battings.triples - battings.home_runs) + (2*battings.doubles) + (3*battings.triples) + (4*battings.home_runs))* 1.0) / battings.at_bats) AS slugging_percentage') }
  end
end
