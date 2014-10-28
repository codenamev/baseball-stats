require 'spec_helper'

describe BaseballStats::Batting do
  it { should have_db_column(:player_id).of_type(:string) }
  it { should have_db_column(:year_id).of_type(:integer) }
  it { should have_db_column(:league).of_type(:string) }
  it { should have_db_column(:team_id).of_type(:string) }
  it { should have_db_column(:appearances).of_type(:string) }
  it { should have_db_column(:at_bats).of_type(:integer) }
  it { should have_db_column(:runs_scored).of_type(:integer) }
  it { should have_db_column(:hits).of_type(:integer) }
  it { should have_db_column(:doubles).of_type(:integer) }
  it { should have_db_column(:triples).of_type(:integer) }
  it { should have_db_column(:home_runs).of_type(:integer) }
  it { should have_db_column(:runs_batted_in).of_type(:integer) }
  it { should have_db_column(:stolen_bases).of_type(:integer) }
  it { should have_db_column(:times_caught_stealing).of_type(:integer) }
end
