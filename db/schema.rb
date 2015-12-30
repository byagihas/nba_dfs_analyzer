# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151118205526) do

  create_table "line_up_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lineup_items", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "lineup_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "cost"
    t.float    "avgpoints"
    t.string   "position"
    t.text     "name"
    t.text     "team"
  end

  add_index "lineup_items", ["lineup_id"], name: "index_lineup_items_on_lineup_id"
  add_index "lineup_items", ["player_id"], name: "index_lineup_items_on_player_id"

  create_table "lineups", force: :cascade do |t|
    t.decimal  "totalavg"
    t.decimal  "avgmin"
    t.integer  "totalcost"
    t.decimal  "totalassists"
    t.decimal  "totalrebs"
    t.decimal  "totalsteals"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "mlbplayers", force: :cascade do |t|
    t.string   "name"
    t.string   "team"
    t.string   "position"
    t.string   "battingpos"
    t.string   "salary"
    t.float    "avgpoints"
    t.float    "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "nbaplayers", force: :cascade do |t|
    t.text     "name"
    t.string   "position"
    t.text     "team"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float    "avgpoints"
    t.integer  "cost"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
