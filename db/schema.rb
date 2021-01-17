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

ActiveRecord::Schema.define(version: 20210111191959) do

  create_table "applications", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.string   "token"
    t.string   "name"
    t.integer  "chats_count", default: 0
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["token"], name: "index_applications_on_token", unique: true, using: :btree
  end

  create_table "chats", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "number"
    t.integer  "application_id"
    t.integer  "messages_count", default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["application_id"], name: "index_chats_on_application_id", using: :btree
  end

  create_table "messages", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4" do |t|
    t.integer  "number"
    t.text     "body",       limit: 65535
    t.integer  "chat_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id", using: :btree
  end

  add_foreign_key "chats", "applications"
  add_foreign_key "messages", "chats"
end
