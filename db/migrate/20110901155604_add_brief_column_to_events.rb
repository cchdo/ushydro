class AddBriefColumnToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :brief, :string
  end

  def self.down
    remove_column :events, :brief
  end
end
