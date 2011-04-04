class CreateCruisesParameters < ActiveRecord::Migration
  def self.up
    create_table :cruises_parameters do |t|
      t.integer   :cruise_id
      t.integer   :parameter_id

      t.timestamps
    end
  end

  def self.down
    drop_table :cruises_parameters
  end
end
