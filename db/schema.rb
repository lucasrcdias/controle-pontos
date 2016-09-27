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

ActiveRecord::Schema.define(version: 20160923113319) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "social_reason"
    t.string   "fantasy_name"
    t.string   "cnpj"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.integer  "manager_id"
    t.float    "latitude"
    t.float    "longitude"
    t.float    "radius"
    t.time     "extra_hours_limit"
  end

  add_index "companies", ["manager_id"], name: "index_companies_on_manager_id", using: :btree

  create_table "frequencies", force: :cascade do |t|
    t.integer "days",       default: [], array: true
    t.integer "company_id"
  end

  add_index "frequencies", ["company_id"], name: "index_frequencies_on_company_id", using: :btree

  create_table "managers", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "managers", ["user_id"], name: "index_managers_on_user_id", using: :btree

  create_table "periods", force: :cascade do |t|
    t.time     "start_at"
    t.time     "finish_at"
    t.time     "interval_start"
    t.time     "interval_finish"
    t.integer  "company_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "periods", ["company_id"], name: "index_periods_on_company_id", using: :btree

  create_table "points", force: :cascade do |t|
    t.datetime "date"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "worker_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "kind",       default: 0
  end

  add_index "points", ["worker_id"], name: "index_points_on_worker_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["company_id"], name: "index_roles_on_company_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "auth_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workers", force: :cascade do |t|
    t.integer  "internal_id"
    t.integer  "kind"
    t.string   "document"
    t.datetime "admitted_at"
    t.integer  "user_id"
    t.integer  "company_id"
    t.integer  "period_id"
    t.integer  "frequency_id"
    t.integer  "role_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "workers", ["company_id"], name: "index_workers_on_company_id", using: :btree
  add_index "workers", ["frequency_id"], name: "index_workers_on_frequency_id", using: :btree
  add_index "workers", ["period_id"], name: "index_workers_on_period_id", using: :btree
  add_index "workers", ["role_id"], name: "index_workers_on_role_id", using: :btree
  add_index "workers", ["user_id"], name: "index_workers_on_user_id", using: :btree

  add_foreign_key "companies", "managers"
  add_foreign_key "managers", "users"
  add_foreign_key "points", "workers"
  add_foreign_key "workers", "companies"
  add_foreign_key "workers", "frequencies"
  add_foreign_key "workers", "periods"
  add_foreign_key "workers", "roles"
  add_foreign_key "workers", "users"
end
