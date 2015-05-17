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

ActiveRecord::Schema.define(version: 20150517102957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.text     "english"
    t.text     "phonetic"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "category",    limit: 255
    t.string   "picture",     limit: 255
    t.integer  "language_id"
  end

  add_index "articles", ["language_id"], name: "index_articles_on_language_id", using: :btree

  create_table "contributors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contributors", ["site_id"], name: "index_contributors_on_site_id", using: :btree

  create_table "installations", force: :cascade do |t|
    t.string   "installation", limit: 255
    t.string   "email",        limit: 255
    t.text     "address"
    t.string   "contact",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "languages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "installation_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["installation_id"], name: "index_sites_on_installation_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
    t.string   "email",                  limit: 255
    t.string   "username",               limit: 255
    t.string   "location",               limit: 255
    t.string   "contact",                limit: 255
    t.string   "gender",                 limit: 255
    t.string   "bk_role",                limit: 255
    t.string   "login_approval",         limit: 255
    t.string   "lang",                   limit: 255
    t.integer  "role"
  end

  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "volunteers", force: :cascade do |t|
    t.string   "vname",      limit: 255
    t.integer  "site_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "volunteers", ["site_id"], name: "index_volunteers_on_site_id", using: :btree

end
