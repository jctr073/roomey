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

ActiveRecord::Schema.define(version: 20150404224215) do

  create_table "amenities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lifestyle_tags", force: :cascade do |t|
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "neighborhoods", force: :cascade do |t|
    t.string   "city_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "room_amenities", id: false, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "room_id"
    t.integer  "amenity_id"
  end

  add_index "room_amenities", ["room_id", "amenity_id"], name: "index_room_amenities_on_room_id_and_amenity_id"

  create_table "room_lifestyle_tags", force: :cascade do |t|
    t.integer  "room_id"
    t.integer  "lifestyle_tag_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "room_lifestyle_tags", ["lifestyle_tag_id"], name: "index_room_lifestyle_tags_on_lifestyle_tag_id"
  add_index "room_lifestyle_tags", ["room_id"], name: "index_room_lifestyle_tags_on_room_id"

  create_table "rooms", force: :cascade do |t|
    t.string   "short_desc"
    t.decimal  "price",           precision: 10, scale: 2
    t.text     "description"
    t.integer  "size"
    t.integer  "user_id"
    t.integer  "neighborhood_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "rooms", ["neighborhood_id"], name: "index_rooms_on_neighborhood_id"
  add_index "rooms", ["user_id"], name: "index_rooms_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",                                      default: false
    t.string   "activation_digest"
    t.boolean  "activated",                                  default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.integer  "age"
    t.boolean  "seeker",                                     default: false
    t.string   "gender"
    t.decimal  "price",             precision: 10, scale: 2
    t.string   "phone"
    t.integer  "neighborhood_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
