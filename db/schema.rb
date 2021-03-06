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

ActiveRecord::Schema.define(version: 20140916051351) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boards", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",    default: 0,     null: false
    t.boolean  "public",     default: false
    t.json     "tags"
    t.boolean  "archived",   default: false
  end

  add_index "boards", ["title", "user_id"], name: "index_boards_on_title_and_user_id", unique: true, using: :btree

  create_table "cards", force: true do |t|
    t.string   "title",       null: false
    t.integer  "list_id",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "position"
    t.string   "description"
    t.json     "tags"
    t.json     "members"
  end

  create_table "comments", force: true do |t|
    t.string   "text"
    t.integer  "card_id",    null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lists", force: true do |t|
    t.string   "title",                    null: false
    t.integer  "board_id",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "position",   default: 1.0
  end

  create_table "memberships", force: true do |t|
    t.integer  "roles_mask", default: 0, null: false
    t.integer  "board_id",               null: false
    t.integer  "user_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["board_id", "user_id"], name: "index_memberships_on_board_id_and_user_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username",                            null: false
    t.string   "initials",                            null: false
    t.string   "avatar"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
