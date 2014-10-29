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

  def most_improved_player(year_range)
  end

  def slugging_percentage_for_team(team_id)
  end

  def tripple_crown_winner(year, league)
  end
end
