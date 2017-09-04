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

ActiveRecord::Schema.define(version: 20151111143107) do

  create_table "issue_tracking_replies", force: :cascade do |t|
    t.integer  "ticket_id"
    t.integer  "status_id"
    t.integer  "user_id"
    t.string   "reply_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "issue_tracking_replies", ["status_id"], name: "index_issue_tracking_replies_on_status_id"
  add_index "issue_tracking_replies", ["ticket_id"], name: "index_issue_tracking_replies_on_ticket_id"

  create_table "issue_tracking_statuses", force: :cascade do |t|
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "issue_tracking_tickets", force: :cascade do |t|
    t.integer  "reply_id"
    t.string   "unique_reference"
    t.string   "url"
    t.string   "subject"
    t.string   "body"
    t.string   "department"
    t.string   "customer"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "issue_tracking_tickets", ["reply_id"], name: "index_issue_tracking_tickets_on_reply_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
