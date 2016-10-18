# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20161018021221) do

  create_table "polling_locations", force: :cascade do |t|
    t.text     "name"
    t.text     "street"
    t.text     "cityStateZip"
    t.datetime "date"
    t.text     "hours"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "uid"
    t.string   "wait"
  end

  create_table "users", force: :cascade do |t|
    t.text  "current_location"
    t.text  "input_location"
    t.text  "gps_location"
    t.float "latitude"
    t.float "longitude"
  end

end
