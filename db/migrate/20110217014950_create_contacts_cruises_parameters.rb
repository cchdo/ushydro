class CreateContactsCruisesParameters < ActiveRecord::Migration
  def self.up
    create_table :contacts_cruises_parameters, :id => false do |t|
      t.integer :contact_id
      t.integer :cruises_parameters_id
      
    end
  end

  def self.down
    drop_table :contacts_cruises_parameters
  end
end
