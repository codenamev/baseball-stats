require 'spec_helper'

describe BaseballStats do
  context '#import' do
    subject { BaseballStats.import }

    it "imports sample data by default" do
      subject
      Batting.count.should == 1
    end
  end
end
