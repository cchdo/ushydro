class CreateCruises < ActiveRecord::Migration
  def self.up
    create_table :cruises do |t|
      t.string    :name
      t.integer   :days
      t.integer   :stations
      t.integer   :ship_id
      t.string    :expocode
      t.date      :start_date
      t.date      :end_date
      t.string    :underway_nav_link
      t.string    :underway_adcp_link
      t.string    :lowered_adcp_link
      t.string    :underway_meta_link

      t.timestamps
    end
  end

  def self.down
    drop_table :cruises
  end
end
