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

ActiveRecord::Schema.define(version: 20170807124859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "type"
    t.string "name"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.string "address"
    t.string "area"
    t.string "img"
    t.text "description"
    t.integer "pax_required"
    t.integer "pax_registered"
    t.integer "unit_time_credit"
    t.string "created_by"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events_organisations", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "organisation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_events_organisations_on_event_id"
    t.index ["organisation_id"], name: "index_events_organisations_on_organisation_id"
  end

  create_table "events_users", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_events_users_on_event_id"
    t.index ["user_id"], name: "index_events_users_on_user_id"
  end

  create_table "organisations", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "uen"
    t.string "profile_img"
    t.integer "tel"
    t.integer "time_credit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "nric"
    t.string "nric_img"
    t.string "profile_img"
    t.integer "tel"
    t.integer "time_credit"
    t.boolean "admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events_organisations", "events"
  add_foreign_key "events_organisations", "organisations"
  add_foreign_key "events_users", "events"
  add_foreign_key "events_users", "users"
end
