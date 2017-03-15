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

ActiveRecord::Schema.define(version: 20170105124952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "page_versions", force: :cascade do |t|
    t.integer  "user_id",                null: false
    t.integer  "page_id",                null: false
    t.integer  "version",    default: 0, null: false
    t.string   "title",                  null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",                       null: false
    t.text     "body",                        null: false
    t.text     "body_html"
    t.integer  "editor_ids",     default: [], null: false, array: true
    t.integer  "comments_count", default: 0,  null: false
    t.integer  "changes_count",  default: 1,  null: false
    t.integer  "word_count",     default: 0,  null: false
    t.datetime "deleted_at"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
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
