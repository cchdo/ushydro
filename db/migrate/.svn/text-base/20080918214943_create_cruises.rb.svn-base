class CreateCruises < ActiveRecord::Migration
  def self.up
    unless table_exists? :cruises
    create_table :cruises do |t|
      t.column  :begin_date, :date
      t.column  :end_year, :integer
      t.column  :end_date, :date
      t.column  :cruise, :string
      t.column  :begin_port, :string
      t.column  :end_port, :string
      t.column  :contact_chief_scientist, :string
      t.column  :ship, :string
      t.column  :ship_link, :string
      t.timestamps
    end
    end
  end
end
