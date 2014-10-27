require 'spec_helper'
require 'active_record'

describe BaseballStats::Database do
  context '.connection' do
    subject { BaseballStats::Database.connection }

    it 'estabilishes a logger' do
      expect(Logger).to receive(:new).with('log/test.log')
      subject
    end

    it 'establishes a connection using the env configuration' do
      configuration = YAML::load(IO.read('config/database.yml'))
      expect(ActiveRecord::Base).to receive(:establish_connection).with(configuration['test'])
      subject
    end
  end
end
