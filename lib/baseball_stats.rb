require 'rubygems'
require 'active_record'
require 'sqlite3'

require "baseball_stats/batting"
require "baseball_stats/player"
require "baseball_stats/database"
require "baseball_stats/import"
require "baseball_stats/version"

module BaseballStats
  include Import
  include Database

  extend self

  def most_improved_player(year)
    battings_for_year          = Batting.with_batting_average.where('year_id = ? AND at_bats >= 200', year).order(player_id: :asc)
    battings_for_previous_year = Batting.with_batting_average.where('year_id = ? AND at_bats >= 200', year-1).order(player_id: :asc)

    most_improved_batting_average = 0.0
    most_improved_player          = nil

    battings_for_year.each do |batting|
      improvement = batting.batting_average - battings_for_previous_year.where(player_id: batting.player_id).first.batting_average
      next unless improvement > most_improved_batting_average
      most_improved_batting_average = batting.batting_average
      most_improved_player = batting.player_id
    end

    Player.where(player_id: most_improved_player).first
  end

  def slugging_percentage_for_team_and_year(team_id, year)
    battings_for_team = Batting.includes(:player).with_slugging_percentage.where(team_id: team_id, year_id: year)
    battings_for_team.collect {|batting|
      { player: batting.player_name, slugging_percentage: batting.slugging_percentage }
    }
  end

  def tripple_crown_winner(year, league)
    highest_batting_average = Batting.with_batting_average.tripple_crown_eligible.where(year_id: year, league: league).order('batting_average DESC').first
    most_home_runs          = Batting.tripple_crown_eligible.where(year_id: year, league: league).order(home_runs: :desc).first
    most_rbis               = Batting.tripple_crown_eligible.where(year_id: year, league: league).order(runs_batted_in: :desc).first

    if highest_batting_average and most_home_runs and most_rbis and
       highest_batting_average.player_id == most_home_runs.player_id and highest_batting_average.player_id == most_rbis.player_id
      most_rbis.player
    else
      '(No winner)'
    end
  end
end
