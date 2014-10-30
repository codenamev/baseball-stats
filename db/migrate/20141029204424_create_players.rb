class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.string :player_id
      t.integer :birth_year
      t.string :first_name
      t.string :last_name
    end

    add_index :players, :player_id
  end

  def self.down
    drop_table :players
  end
end
