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

ActiveRecord::Schema.define(version: 20170522012412) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "page_tags", force: :cascade do |t|
    t.string   "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "page_id",    null: false
    t.integer  "tag_id",     null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",        null: false
    t.text     "content",      null: false
    t.integer  "user_id",      null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.text     "summary"
    t.integer  "category"
    t.integer  "click_count"
    t.datetime "created"
    t.datetime "updated"
    t.text     "content_html"
  end

  create_table "tags", force: :cascade do |t|
    t.string   "about"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name",       null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "admin",                default: false
    t.datetime "activated"
    t.string   "authentication_token"
    t.string   "password_digest"
  end

end
