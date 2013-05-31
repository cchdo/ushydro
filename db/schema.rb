# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130530231859) do

  create_table "collectors", :force => true do |t|
    t.integer  "cruise_id"
    t.integer  "parameter_id"
    t.integer  "leg"
    t.integer  "person_id"
    t.integer  "institution_id"
    t.boolean  "not_collected",  :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "title"
    t.integer  "institution"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts_cruises_parameters", :id => false, :force => true do |t|
    t.integer "contact_id"
    t.integer "cruises_parameter_id"
  end

  create_table "cruises", :force => true do |t|
    t.string   "name"
    t.integer  "days"
    t.integer  "stations"
    t.integer  "ship_id"
    t.string   "expocode"
    t.date     "start_date"
    t.date     "end_date"
    t.string   "underway_nav_link"
    t.string   "underway_adcp_link"
    t.string   "lowered_adcp_link"
    t.string   "underway_meta_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "start_port_id"
    t.integer  "end_port_id"
    t.string   "start_port_type",    :limit => 11, :default => "Port", :null => false
    t.string   "end_port_type",      :limit => 11, :default => "Port", :null => false
    t.string   "contact"
  end

  create_table "cruises_parameters", :force => true do |t|
    t.integer  "cruise_id"
    t.integer  "parameter_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cruises_parameters", ["cruise_id"], :name => "cruise_id"
  add_index "cruises_parameters", ["parameter_id"], :name => "parameter_id"

  create_table "events", :force => true do |t|
    t.integer  "cruises_parameter_id", :null => false
    t.datetime "date"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category"
    t.text     "brief",                :null => false
  end

  create_table "institutions", :force => true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "parameters", :force => true do |t|
    t.string   "name"
    t.string   "full_name"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ports", :force => true do |t|
    t.string   "name"
    t.string   "country"
    t.float    "lat"
    t.float    "lon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "positions", :id => false, :force => true do |t|
    t.decimal "latitude",  :precision => 8, :scale => 4
    t.decimal "longitude", :precision => 8, :scale => 4
  end

  create_table "posts", :id => false, :force => true do |t|
    t.date     "post_date"
    t.string   "post_type",   :limit => 16
    t.decimal  "latitude",                  :precision => 8, :scale => 4
    t.decimal  "longitude",                 :precision => 8, :scale => 4
    t.string   "post"
    t.text     "excerpt"
    t.datetime "received_dt"
  end

  create_table "ships", :force => true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "states", :id => false, :force => true do |t|
    t.integer "cruises_parameters_id", :default => 0, :null => false
    t.date    "policy_letter"
    t.text    "notes"
    t.integer "preliminary"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
