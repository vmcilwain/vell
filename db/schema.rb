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

ActiveRecord::Schema.define(version: 20151020230703) do

  create_table "blog_categories", force: :cascade do |t|
    t.string  "name",    limit: 255
    t.boolean "enabled", limit: 1
  end

  create_table "blog_comments", force: :cascade do |t|
    t.integer  "blog_id",    limit: 4
    t.string   "name",       limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_files", force: :cascade do |t|
    t.integer  "blog_id",          limit: 4
    t.string   "description",      limit: 255
    t.integer  "created_by",       limit: 4
    t.integer  "updated_by",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "doc_file_name",    limit: 255
    t.string   "doc_content_type", limit: 255
    t.integer  "doc_file_size",    limit: 4
    t.datetime "doc_updated_at"
  end

  create_table "blogs", force: :cascade do |t|
    t.integer  "blog_category_id", limit: 4
    t.string   "headline",         limit: 255
    t.text     "body",             limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "to_twitter",       limit: 1,     default: false
  end

  create_table "contact_mes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "homes", force: :cascade do |t|
    t.text "index", limit: 65535
    t.text "about", limit: 65535
  end

  create_table "photo_albums", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photo_comments", force: :cascade do |t|
    t.integer  "photo_id",   limit: 4
    t.string   "name",       limit: 255
    t.string   "headline",   limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "photo_album_id",        limit: 4
    t.string   "description",           limit: 255
    t.integer  "created_by",            limit: 4
    t.integer  "updated_by",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "document_file_name",    limit: 255
    t.string   "document_content_type", limit: 255
    t.integer  "document_file_size",    limit: 4
    t.datetime "document_updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.boolean  "admin",                  limit: 1
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
