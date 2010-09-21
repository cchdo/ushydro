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

ActiveRecord::Schema.define(:version => 20081007181353) do

  create_table "cruises", :force => true do |t|
    t.text "expocode"
    t.date "begin_date"
    t.date "end_date"
    t.text "cruise"
    t.text "cruise_results"
    t.text "begin_port"
    t.text "end_port"
    t.text "contact_chief_scientist"
    t.text "ship"
    t.text "ship_link"
  end

  create_table "oversight_committee", :force => true do |t|
    t.text "first_name"
    t.text "last_name"
    t.text "institution"
    t.text "position"
    t.text "email"
  end

  create_table "oversight_committees", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
