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

ActiveRecord::Schema.define(version: 20180304132004) do

  create_table "add_browser_language_to_reports", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "applications", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "key"
    t.string "base_url"
  end

  create_table "reports", force: :cascade do |t|
    t.string "application_id"
    t.string "description"
    t.text "screenshot_base64"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "current_url"
    t.string "browser_version"
    t.string "browser_language"
    t.string "browser_resolution"
    t.string "device_resolution"
  end

end
