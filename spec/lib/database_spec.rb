require 'spec_helper'
require 'active_record'

describe BaseballStats::Database do
  let(:configuration) { YAML::load(IO.read('db/config.yml')) }
  context '.configuration' do

    subject { BaseballStats::Database.configuration }
    it      { should == configuration }
  end

  context '.environment' do
    subject { BaseballStats::Database.env }
    it      { should == 'test' }

    context 'APP_ENV is "production"' do
      before { ENV.stub(:[]).with('APP_ENV').and_return('production') }
      it     { should == 'production' }
    end
  end

  context '.db_dir' do
    subject { BaseballStats::Database.db_dir }
    it      { should == File.join(File.expand_path('../../..', __FILE__), 'db') }
  end

  context '.migrations_paths' do
    subject { BaseballStats::Database.migrations_paths }
    it      { should == [File.join(File.expand_path('../../..', __FILE__), 'db/migrate')] }
  end

  context '.connection' do
    subject { BaseballStats::Database.connection }

    it 'estabilishes a logger' do
      expect(Logger).to receive(:new).with('log/test.log')
      subject
    end

    it 'establishes a connection using the env configuration' do
      expect(ActiveRecord::Base).to receive(:establish_connection).with(configuration['test'])
      subject
    end
  end
end
