require 'spec_helper'

describe BaseballStats do
  it { should respond_to :import_battings_from_csv }
  it { should respond_to :env }
  it { should respond_to :connection }

  describe '.most_improved_player(years)' do
    let(:year)                     { 2014 }
    let(:most_improved_player)     { 'chuck_norris' }
    let(:next_improved_player)     { 'randy_savage' }
    let(:insufficient_bats_player) { 'joe_schmoe' }
    let(:wrong_year_player)        { 'joe_schmoe' }

    subject { BaseballStats.most_improved_player(2013..2014) }

    before do
      create :batting, player_id: most_improved_player, year_id: year-1, hits: 1, at_bats: 200
      create :batting, player_id: most_improved_player, year_id: year, hits: 100, at_bats: 200

      create :batting, player_id: next_improved_player, year_id: year-1, hits: 1, at_bats: 200
      create :batting, player_id: next_improved_player, year_id: year, hits: 50, at_bats: 200

      create :batting, player_id: wrong_year_player, year_id: year-2, hits: 1, at_bats: 200
      create :batting, player_id: wrong_year_player, year_id: year-1, hits: 200, at_bats: 200

      create :batting, player_id: insufficient_bats_player, year_id: year-1, hits: 199, at_bats: 199
      create :batting, player_id: insufficient_bats_player, year_id: year, hits: 199, at_bats: 199
    end

    it { should == most_improved_player }
  end

  describe '.slugging_percentage_for_team(team_id)' do
    let(:player1) { 'charlie_sheen' }
    let(:player2) { 'charlie_rose' }
    let(:player3) { 'charlie_chapman' }
    let(:team)    { 'range_rovers' }
    let(:year)    { 2007 }
    let(:player_wrong_team) { 'charlie_horse' }
    let(:player_wrong_year) { 'charlie_mania' }

    subject { BaseballStats.slugging_percentage_for_team(team) }

    before do
      create :batting, player_id: player1, team_id: team, year_id: year, hits: 5, doubles: 1, triples: 1, home_runs: 1, at_bats: 50
      create :batting, player_id: player2, team_id: team, year_id: year, hits: 15, doubles: 2, triples: 1, home_runs: 1, at_bats: 50
      create :batting, player_id: player3, team_id: team, year_id: year, hits: 25, doubles: 2, triples: 2, home_runs: 1, at_bats: 50
    end

    it 'returns an array of hashes for every player for the team for that year and their associated slugging percentage' do
      subject.should == [
        { player: player1, slugging_percentage: 0.22 },
        { player: player2, slugging_percentage: 0.44 },
        { player: player3, slugging_percentage: 0.7 }
      ]
    end
  end

  describe 'tripple_crown_winner(year, league)' do
    let(:year) { 2011 }
    let(:league) { 'AL' }

    subject { BaseballStats.tripple_crown_winner(year, league) }

    it { should == '(No winner)' }

    context 'winner exists for AL' do
      let(:player1) { 'hulk_hogan' }
      let(:player2) { 'randy_savage' }
      let(:player3) { 'andre_the_giant' }
      let(:wrong_year_player) { 'left_hand_luke' }
      let(:wrong_league_player) { 'right_hand_luke' }

      before do
        create :batting, player_id: player1, year_id: year, league: league, hits: 50, home_runs: 50, at_bats: 50, runs_batted_in: 50
        create :batting, player_id: player2, year_id: year, league: league, hits: 49, home_runs: 50, at_bats: 50, runs_batted_in: 50
        create :batting, player_id: player3, year_id: year, league: league, hits: 50, home_runs: 49, at_bats: 50, runs_batted_in: 50

        create :batting, player_id: wrong_year_player, year_id: year-1, league: league, hits: 50, home_runs: 50, at_bats: 50, runs_batted_in: 50
        create :batting, player_id: wrong_league_player, year_id: year, hits: 50, home_runs: 50, at_bats: 50, runs_batted_in: 50
      end

      it { should == player1 }
    end
  end
end
