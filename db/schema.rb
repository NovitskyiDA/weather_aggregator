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

ActiveRecord::Schema.define(version: 20170521155526) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "country_code"
    t.string "images",       array: true
  end

  create_table "locations_users", id: false, force: :cascade do |t|
    t.integer "user_id",     null: false
    t.integer "location_id", null: false
    t.index ["user_id", "location_id"], name: "index_locations_users_on_user_id_and_location_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "auth_token"
    t.string   "password_digest"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "email_confirmed",        default: false
    t.string   "confirm_token"
  end

  create_table "weather_informations", force: :cascade do |t|
    t.integer "location_id"
    t.string  "description"
    t.string  "icon"
    t.integer "current_temp"
    t.integer "temp_max"
    t.integer "temp_min"
    t.integer "humidity"
    t.integer "pressure"
    t.decimal "wind_speed"
    t.integer "wind_degree"
  end

end
