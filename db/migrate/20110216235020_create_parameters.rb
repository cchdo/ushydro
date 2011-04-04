class CreateParameters < ActiveRecord::Migration
  def self.up
    create_table :parameters do |t|
      t.string    :name
      t.string    :full_name
      t.integer   :level
      

      t.timestamps
    end
  end

  def self.down
    drop_table :parameters
  end
end
