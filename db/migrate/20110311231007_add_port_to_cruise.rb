class AddPortToCruise < ActiveRecord::Migration
  def self.up
    add_column :cruises, :start_port, :integer
    add_column :cruises, :end_port, :integer
  end

  def self.down
    remove_column :cruises, :end_port
    remove_column :cruises, :start_port
  end
end
