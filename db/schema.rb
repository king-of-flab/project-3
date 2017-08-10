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

ActiveRecord::Schema.define(version: 20170808215958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string "account_type"
    t.string "name"
    t.integer "tel"
    t.string "identification"
    t.integer "time_credit"
    t.string "verify_image"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "accounts_requests", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_accounts_requests_on_account_id"
    t.index ["request_id"], name: "index_accounts_requests_on_request_id"
  end

  create_table "accounts_rewards", force: :cascade do |t|
    t.bigint "account_id"
    t.bigint "reward_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_accounts_rewards_on_account_id"
    t.index ["reward_id"], name: "index_accounts_rewards_on_reward_id"
  end

  create_table "requests", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.string "address"
    t.string "area"
    t.text "description"
    t.string "image"
    t.integer "opening"
    t.integer "unit_time_credit"
    t.bigint "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rewards", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.string "address"
    t.string "area"
    t.text "description"
    t.string "image"
    t.integer "opening"
    t.integer "unit_time_credit"
    t.bigint "created_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "accounts_requests", "accounts"
  add_foreign_key "accounts_requests", "requests"
  add_foreign_key "accounts_rewards", "accounts"
  add_foreign_key "accounts_rewards", "rewards"
end
