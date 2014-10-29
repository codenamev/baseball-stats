require 'spec_helper'

describe BaseballStats::Import do
  context '.battings_from_csv(csv_file)' do
    let(:csv_file)          { File.expand_path('spec/fixtures/batting.csv') }
    let(:csv_file_with_dup) { File.expand_path('spec/fixtures/batting_with_existing.csv') }
    subject                 { BaseballStats::Import.battings_from_csv(csv_file) }

    it 'imports all battings into the database' do
      expect{ subject }.to change{ BaseballStats::Batting.count }.to 16
    end

    it "only imports battings that don't yet exist" do
      subject
      expect{ BaseballStats::Import.battings_from_csv(csv_file_with_dup) }.to change{ BaseballStats::Batting.count }.by(1)
    end

    context 'db has not yet run migrations' do
      before { ActiveRecord::Base.connection.stub(:table_exists?).with('battings').and_return(true) }
      it "doesn't run the CreateBattings migration" do
        expect(CreateBattings).to_not receive(:up)
        subject
      end
    end

    context 'db has not yet run migrations' do
      before { ActiveRecord::Base.connection.stub(:table_exists?).with('battings').and_return(false) }
      it 'Runs the CreateBattings migration' do
        expect(CreateBattings).to receive(:up)
        subject
      end
    end
  end
end
