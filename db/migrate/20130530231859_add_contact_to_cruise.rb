class AddContactToCruise < ActiveRecord::Migration
  def self.up
    add_column :cruises, :contact, :string
  end

  def self.down
    remove_column :cruises, :contact
  end
end
