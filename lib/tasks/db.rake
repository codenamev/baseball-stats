require 'active_record/base'

namespace :db do
  task :load_config do
    BaseballStats::Database.connection
    ActiveRecord::Tasks::DatabaseTasks.db_dir                 = BaseballStats::Database.db_dir
    ActiveRecord::Tasks::DatabaseTasks.database_configuration = BaseballStats::Database.configuration
    ActiveRecord::Tasks::DatabaseTasks.migrations_paths       = BaseballStats::Database.migrations_paths
  end
end

load "active_record/railties/databases.rake"
