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

ActiveRecord::Schema.define(version: 20170714212300) do

  create_table "projects", force: :cascade do |t|
    t.string  "name",        null: false
    t.date    "start_date",  null: false
    t.date    "end_date"
    t.string  "description", null: false
    t.integer "user_id",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email",           null: false
    t.text   "password_digest", null: false
    t.string "first_name",      null: false
    t.string "last_name",       null: false
  end

  create_table "work_sessions", force: :cascade do |t|
    t.date    "date",        null: false
    t.string  "description", null: false
    t.boolean "is_billable", null: false
    t.time    "start_time",  null: false
    t.time    "end_time",    null: false
    t.integer "project_id",  null: false
  end

end
