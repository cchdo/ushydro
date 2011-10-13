class AddCategoryToEvents < ActiveRecord::Migration
  def self.up
    remove_column :events, :type
    add_column :events, :category, :string
  end

  def self.down
    remove_column :events, :category
    add_column :events, :type, :string
  end
end
