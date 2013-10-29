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

ActiveRecord::Schema.define(version: 20131025195947) do

  create_table "absence_types", force: true do |t|
    t.string "name"
  end

  create_table "absences", force: true do |t|
    t.datetime "date_from"
    t.datetime "date_to"
    t.string   "description"
    t.decimal  "working_days_used", precision: 4, scale: 1
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "holiday_status_id"
    t.integer  "user_id"
    t.text     "notes"
    t.string   "uuid"
    t.integer  "holiday_year_id"
    t.integer  "absence_type_id"
  end

  create_table "bank_holidays", force: true do |t|
    t.string   "name"
    t.date     "date_of_hol"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holiday_statuses", force: true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "holiday_years", force: true do |t|
    t.date     "date_start"
    t.date     "date_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: true do |t|
    t.integer  "year_start_day"
    t.integer  "year_start_month"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_days", force: true do |t|
    t.integer  "user_id"
    t.decimal  "no_days",                     precision: 4, scale: 1
    t.string   "reason",          limit: 100
    t.integer  "holiday_year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_days_for_years", force: true do |t|
    t.decimal  "days_remaining",  precision: 4, scale: 1
    t.integer  "user_id"
    t.integer  "holiday_year_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                              default: "", null: false
    t.string   "encrypted_password",                 default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_type_id",           limit: 255
    t.integer  "manager_id"
    t.string   "forename",               limit: 80
    t.string   "surname",                limit: 80
    t.string   "invitation_token",       limit: 60
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.datetime "remember_created_at"
    t.datetime "invitation_created_at"
    t.string   "authentication_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
