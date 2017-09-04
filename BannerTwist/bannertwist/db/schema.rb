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

ActiveRecord::Schema.define(version: 20150710125728) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "banner_sites", force: :cascade do |t|
    t.integer  "banner_id"
    t.integer  "site_id"
    t.integer  "max_show",     default: 100,  null: false
    t.integer  "show_number",  default: 0
    t.integer  "click_number", default: 0
    t.integer  "show_time",    default: 5000
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "banner_sites", ["banner_id"], name: "index_banner_sites_on_banner_id"
  add_index "banner_sites", ["site_id"], name: "index_banner_sites_on_site_id"

  create_table "banners", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "uri",        null: false
    t.string   "link",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sites", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "host",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
