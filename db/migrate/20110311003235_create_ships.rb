class CreateShips < ActiveRecord::Migration
  def self.up
    create_table :ships do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :ships
  end
end
