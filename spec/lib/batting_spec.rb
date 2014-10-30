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
  it { should belong_to(:player) }

  describe ".with_batting_average" do
    let!(:batting) { create :batting, hits: 100, at_bats: 200 }
    subject        { BaseballStats::Batting.with_batting_average }

    it "includes the batting average with the result batting" do
      expect( subject.first.batting_average ).to equal 0.5
    end
  end

  describe ".with_slugging_percentage" do
    let!(:batting) { create :batting, hits: 100, doubles: 1, triples: 1, home_runs: 1, at_bats: 200 }
    subject        { BaseballStats::Batting.with_slugging_percentage }

    it "includes the slugging percentage with the result batting" do
      expect( subject.first.slugging_percentage).to equal 0.53
    end
  end

  describe ".tripple_crown_eligible" do
    let!(:eligible)   { create :batting, at_bats: 400 }
    let!(:ineligible) { create :batting, at_bats: 399 }
    subject           { BaseballStats::Batting.tripple_crown_eligible }
    it                { should == [eligible] }
  end
end
