class CreateInstitutions < ActiveRecord::Migration
  def self.up
    create_table :institutions do |t|
      t.string    :name
      t.string    :abbreviation
      t.string    :website

      t.timestamps
    end
  end

  def self.down
    drop_table :institutions
  end
end
