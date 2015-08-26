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

ActiveRecord::Schema.define(version: 20150826023707) do

  create_table "categories", force: :cascade do |t|
    t.string   "label"
    t.text     "description"
    t.string   "color"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",          default: 0
    t.integer  "children_count", default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "icon"
  end

  add_index "categories", ["lft"], name: "index_categories_on_lft"
  add_index "categories", ["parent_id"], name: "index_categories_on_parent_id"
  add_index "categories", ["rgt"], name: "index_categories_on_rgt"

  create_table "categories_events", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "event_id"
  end

  add_index "categories_events", ["category_id"], name: "index_categories_events_on_category_id"
  add_index "categories_events", ["event_id"], name: "index_categories_events_on_event_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "author_id"
    t.integer  "quote_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "label"
    t.text     "description"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "source_id"
    t.boolean  "age",         default: false
    t.date     "start_date"
    t.date     "end_date"
  end

  create_table "outlines", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string   "label"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "screen_label"
  end

  create_table "people_sources", id: false, force: :cascade do |t|
    t.integer "person_id"
    t.integer "source_id"
  end

  add_index "people_sources", ["person_id"], name: "index_people_sources_on_person_id"
  add_index "people_sources", ["source_id"], name: "index_people_sources_on_source_id"

  create_table "quotes", force: :cascade do |t|
    t.string   "label"
    t.text     "content"
    t.integer  "toc_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sources", force: :cascade do |t|
    t.string   "label"
    t.text     "description"
    t.string   "link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "category_id"
    t.integer  "toc_id"
  end

  create_table "tocs", force: :cascade do |t|
    t.string   "label"
    t.integer  "outline_id"
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.integer  "depth",          default: 0
    t.integer  "children_count", default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "tocs", ["lft"], name: "index_tocs_on_lft"
  add_index "tocs", ["parent_id"], name: "index_tocs_on_parent_id"
  add_index "tocs", ["rgt"], name: "index_tocs_on_rgt"

end
