require 'csv'

# Require all migration files
Dir[File.expand_path('../../../db/migrate/*.rb', __FILE__)].each {|f| require f }

module BaseballStats::Import
  extend self

  def from_csv(csv_file)
    CreateBattings.up unless ActiveRecord::Base.connection.table_exists?('battings')
  private
  end
end
