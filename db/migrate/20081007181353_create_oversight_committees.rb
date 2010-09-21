class CreateOversightCommittees < ActiveRecord::Migration
  def self.up
    create_table :oversight_committees do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :oversight_committees
  end
end
