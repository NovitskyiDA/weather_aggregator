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

ActiveRecord::Schema.define(version: 20170523183612) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.string   "author_type"
    t.integer  "author_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
  end

  create_table "locations", force: :cascade do |t|
    t.string "country"
    t.string "city"
    t.string "country_code"
    t.string "images",       default: [], array: true
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
    t.boolean  "admin",                  default: false
  end

  create_table "weather_informations", force: :cascade do |t|
    t.integer  "location_id"
    t.string   "description"
    t.string   "icon"
    t.integer  "current_temp"
    t.integer  "temp_max"
    t.integer  "temp_min"
    t.integer  "humidity"
    t.integer  "pressure"
    t.decimal  "wind_speed"
    t.integer  "wind_degree"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end
