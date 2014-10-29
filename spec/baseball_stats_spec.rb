require 'spec_helper'

describe BaseballStats do
  it { should respond_to :import_battings_from_csv }
  it { should respond_to :env }
  it { should respond_to :connection }
end
