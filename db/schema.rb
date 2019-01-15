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

ActiveRecord::Schema.define(version: 2019_01_15_090920) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colors", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "red"
    t.integer "green"
    t.integer "blue"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["user_id"], name: "index_colors_on_user_id"
  end

  create_table "lights", force: :cascade do |t|
    t.bigint "session_id"
    t.datetime "switched_on"
    t.datetime "switched_off"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_lights_on_session_id"
  end

  create_table "sessions", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "logged_in"
    t.datetime "logged_out"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sessions_on_user_id"
  end

  create_table "temperature_readings", force: :cascade do |t|
    t.bigint "session_id"
    t.integer "reading"
    t.datetime "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["session_id"], name: "index_temperature_readings_on_session_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "colors", "users"
  add_foreign_key "lights", "sessions"
  add_foreign_key "sessions", "users"
  add_foreign_key "temperature_readings", "sessions"
end
