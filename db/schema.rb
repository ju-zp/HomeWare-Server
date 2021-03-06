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

  create_table "boards", force: :cascade do |t|
    t.string "name"
    t.bigint "home_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_boards_on_home_id"
  end

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

  create_table "homes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lights", force: :cascade do |t|
    t.bigint "board_id"
    t.boolean "switched_on"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_lights_on_board_id"
  end

  create_table "temperature_readings", force: :cascade do |t|
    t.bigint "temperature_id"
    t.integer "reading"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["temperature_id"], name: "index_temperature_readings_on_temperature_id"
  end

  create_table "temperatures", force: :cascade do |t|
    t.integer "interval"
    t.bigint "board_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["board_id"], name: "index_temperatures_on_board_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.bigint "home_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_users_on_home_id"
  end

  add_foreign_key "colors", "users"
end
