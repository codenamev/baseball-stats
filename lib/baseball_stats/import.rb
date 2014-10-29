# encoding: UTF-8

require 'csv'
require "baseball_stats/batting"

# Require all migration files
Dir[File.expand_path('../../../db/migrate/*.rb', __FILE__)].each {|f| require f }

module BaseballStats::Import
  extend self

  def import_battings_from_csv(csv_file)
    CreateBattings.up unless ActiveRecord::Base.connection.table_exists?('battings')
    CSV.foreach(csv_file, headers: true, header_converters: :symbol) do |batting|
      batting                       = BaseballStats::Batting.find_or_create_by(player_id: batting[:player_id], year_id: batting[:year_id])
      batting.league                = batting[:league]
      batting.team_id               = batting[:team_i]
      batting.appearances           = batting[:appearances]
      batting.at_bats               = batting[:at_bats]
      batting.runs_scored           = batting[:runs_scored]
      batting.hits                  = batting[:hits]
      batting.doubles               = batting[:doubles]
      batting.triples               = batting[:triples]
      batting.home_runs             = batting[:home_runs]
      batting.runs_batted_in        = batting[:runs_batted_in]
      batting.stolen_bases          = batting[:stolen_bases]
      batting.times_caught_stealing = batting[:times_caught_stealing]
      batting.save!
    end
  end
end
