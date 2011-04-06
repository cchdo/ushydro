class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.primary_key :id
      t.integer :cruises_parameter_id, :null => false
      t.string :type
      t.datetime :date
      t.text :notes

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
