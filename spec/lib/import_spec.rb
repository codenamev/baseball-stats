require 'spec_helper'

describe BaseballStats::Import do
  context '.from_csv(csv_file)' do
    let(:csv_file) { File.expand_path('../../fixtures/batting.csv') }
    subject { BaseballStats::Import.from_csv(csv_file) }
    context 'db has not yet run migrations' do
      before { ActiveRecord::Base.connection.stub(:table_exists?).with('battings').and_return(false) }
      it 'Runs the CreateBattings migration' do
        expect(CreateBattings).to receive(:up)
        subject
      end
    end
  end
end
