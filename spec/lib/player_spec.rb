require 'spec_helper'

describe BaseballStats::Player do
  it { should have_db_column(:player_id).of_type(:string) }
  it { should have_db_column(:birth_year).of_type(:integer) }
  it { should have_db_column(:first_name).of_type(:string) }
  it { should have_db_column(:last_name).of_type(:string) }

  describe '#name' do
    let(:player) { create :player }
    subject      { player.name }
    it           { should == "#{player.first_name} #{player.last_name}" }
  end
end
