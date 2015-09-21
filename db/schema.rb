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

ActiveRecord::Schema.define(version: 20150301145259) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_tokens", force: :cascade do |t|
    t.string   "name"
    t.string   "token"
    t.string   "secret"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authie_sessions", force: :cascade do |t|
    t.string   "token"
    t.string   "browser_id"
    t.integer  "user_id"
    t.boolean  "active",             default: true
    t.text     "data"
    t.datetime "expires_at"
    t.datetime "login_at"
    t.string   "login_ip"
    t.datetime "last_activity_at"
    t.string   "last_activity_ip"
    t.string   "last_activity_path"
    t.string   "user_agent"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_type"
    t.integer  "parent_id"
  end

  add_index "authie_sessions", ["browser_id"], name: "index_authie_sessions_on_browser_id", using: :btree
  add_index "authie_sessions", ["token"], name: "index_authie_sessions_on_token", using: :btree
  add_index "authie_sessions", ["user_id"], name: "index_authie_sessions_on_user_id", using: :btree

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "email_templates", force: :cascade do |t|
    t.string   "name"
    t.string   "subject"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "history_items", force: :cascade do |t|
    t.string   "item_type"
    t.integer  "item_id"
    t.datetime "date"
  end

  create_table "issue_service_joins", force: :cascade do |t|
    t.integer  "issue_id"
    t.integer  "service_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issue_updates", force: :cascade do |t|
    t.integer  "issue_id"
    t.integer  "user_id"
    t.integer  "service_status_id"
    t.string   "state"
    t.text     "text"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "identifier"
    t.boolean  "notify",            default: false
  end

  create_table "issues", force: :cascade do |t|
    t.string   "title"
    t.string   "state"
    t.integer  "service_status_id"
    t.boolean  "all_services",      default: true
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "user_id"
    t.string   "identifier"
    t.boolean  "notify",            default: false
  end

  create_table "maintenance_service_joins", force: :cascade do |t|
    t.integer  "maintenance_id"
    t.integer  "service_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "maintenance_updates", force: :cascade do |t|
    t.integer  "maintenance_id"
    t.integer  "user_id"
    t.text     "text"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "identifier"
    t.boolean  "notify",         default: false
  end

  create_table "maintenances", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "start_at"
    t.datetime "finish_at"
    t.integer  "length_in_minutes"
    t.integer  "user_id"
    t.integer  "service_status_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.datetime "closed_at"
    t.string   "identifier"
    t.boolean  "notify",            default: false
  end

  create_table "nifty_attachments", force: :cascade do |t|
    t.integer  "parent_id"
    t.string   "parent_type"
    t.string   "token"
    t.string   "digest"
    t.string   "role"
    t.string   "file_name"
    t.string   "file_type"
    t.binary   "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_statuses", force: :cascade do |t|
    t.string   "name"
    t.string   "permalink"
    t.string   "color"
    t.string   "status_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "services", force: :cascade do |t|
    t.string   "name"
    t.string   "permalink"
    t.integer  "position"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "status_id"
    t.text     "description"
  end

  create_table "sites", force: :cascade do |t|
    t.string  "title"
    t.string  "description"
    t.string  "domain"
    t.string  "support_email"
    t.string  "website_url"
    t.string  "time_zone"
    t.boolean "crawling_permitted",  default: false
    t.string  "email_from_name"
    t.string  "email_from_address"
    t.boolean "allow_subscriptions", default: true
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email_address"
    t.string   "verification_token"
    t.datetime "verified_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email_address"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
