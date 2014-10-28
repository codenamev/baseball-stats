class CreateBattings < ActiveRecord::Migration
  def self.up
    create_table :battings do |t|
      t.string :player_id
      t.integer :year_id
      t.string :league
      t.string :team_id
      t.string :appearances
      t.integer :at_bats
      t.integer :runs_scored
      t.integer :hits
      t.integer :doubles
      t.integer :triples
      t.integer :home_runs
      t.integer :runs_batted_in
      t.integer :stolen_bases
      t.integer :times_caught_stealing
    end

    add_index :battings, :player_id
    add_index :battings, :year_id
  end

  def self.down
    drop_table :battings
  end
end
