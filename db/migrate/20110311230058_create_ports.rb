class CreatePorts < ActiveRecord::Migration
  def self.up
    create_table :ports do |t|
        t.string  :name
        t.string  :country
        t.float   :lat
        t.float   :lon
      t.timestamps
    end
  end

  def self.down
    drop_table :ports
  end
end
