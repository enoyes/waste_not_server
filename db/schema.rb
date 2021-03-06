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

ActiveRecord::Schema.define(version: 20160410211019) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "food_items", force: :cascade do |t|
    t.string   "f_id"
    t.string   "name"
    t.string   "desc"
    t.datetime "purchased"
    t.datetime "expiration"
    t.integer  "size_value"
    t.string   "size_unit"
    t.integer  "remaining"
    t.integer  "user_id"
    t.boolean  "public"
    t.integer  "location_id"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locations", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "handle"
    t.string   "email"
    t.string   "password_digest"
    t.string   "token"
    t.datetime "last_sync"
    t.integer  "group_id"
    t.boolean  "group_pending"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
