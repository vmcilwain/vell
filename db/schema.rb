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

ActiveRecord::Schema.define(version: 20150225221324) do

  create_table "blog_categories", force: :cascade do |t|
    t.string  "name",    limit: 255
    t.boolean "enabled", limit: 1
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
  end

  create_table "contact_mes", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "email",      limit: 255
    t.text     "body",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
