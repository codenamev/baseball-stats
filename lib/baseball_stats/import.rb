# encoding: UTF-8

require 'csv'
require "baseball_stats/batting"
require "baseball_stats/player"

# Require all migration files
Dir[File.expand_path('../../../db/migrate/*.rb', __FILE__)].each {|f| require f }

module BaseballStats::Import
  extend self

  def import_battings_from_csv(csv_file)
    CreateBattings.up unless ActiveRecord::Base.connection.table_exists?('battings')
    CSV.foreach(csv_file, headers: true, header_converters: :symbol) do |batting|
      new_batting                       = BaseballStats::Batting.find_or_create_by(player_id: batting[:player_id], year_id: batting[:year_id])
      new_batting.league                = batting[:league]
      new_batting.team_id               = batting[:team_id]
      new_batting.appearances           = batting[:appearances]
      new_batting.at_bats               = batting[:at_bats]
      new_batting.runs_scored           = batting[:runs_scored]
      new_batting.hits                  = batting[:hits]
      new_batting.doubles               = batting[:doubles]
      new_batting.triples               = batting[:triples]
      new_batting.home_runs             = batting[:home_runs]
      new_batting.runs_batted_in        = batting[:runs_batted_in]
      new_batting.stolen_bases          = batting[:stolen_bases]
      new_batting.times_caught_stealing = batting[:times_caught_stealing]
      new_batting.save!
    end
  end

  def import_players_from_csv(csv_file)
    CreatePlayers.up unless ActiveRecord::Base.connection.table_exists?('players')
    CSV.foreach(csv_file, headers: true, header_converters: :symbol) do |player|
      new_player            = BaseballStats::Player.find_or_create_by(player_id: player[:player_id])
      new_player.birth_year = player[:birth_year]
      new_player.first_name = player[:name_first]
      new_player.last_name  = player[:name_last]
      new_player.save!
    end
  end
end
