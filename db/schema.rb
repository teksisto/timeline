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

ActiveRecord::Schema.define(version: 2018_12_17_080256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "label"
    t.text "description"
    t.string "color"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth", default: 0
    t.integer "children_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "icon"
    t.index ["lft"], name: "index_categories_on_lft"
    t.index ["parent_id"], name: "index_categories_on_parent_id"
    t.index ["rgt"], name: "index_categories_on_rgt"
  end

  create_table "categories_events", id: false, force: :cascade do |t|
    t.bigint "category_id"
    t.bigint "event_id"
    t.index ["category_id"], name: "index_categories_events_on_category_id"
    t.index ["event_id"], name: "index_categories_events_on_event_id"
  end

  create_table "comments", force: :cascade do |t|
    t.integer "author_id"
    t.integer "quote_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "label"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "source_id"
    t.boolean "age", default: false
    t.date "start_date"
    t.date "end_date"
    t.boolean "period", default: false
    t.integer "location_id"
    t.text "link"
  end

  create_table "outlines", force: :cascade do |t|
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "source_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "label"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "screen_label"
    t.text "link"
  end

  create_table "people_sources", id: false, force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "source_id"
    t.index ["person_id"], name: "index_people_sources_on_person_id"
    t.index ["source_id"], name: "index_people_sources_on_source_id"
  end

  create_table "quote_versions", force: :cascade do |t|
    t.integer "quote_id"
    t.string "language"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "source_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "category_id"
    t.integer "parent_id"
    t.integer "lft"
    t.integer "rgt"
    t.integer "depth", default: 0
    t.integer "children_count", default: 0
    t.text "link"
  end

  create_table "sources_terms", id: false, force: :cascade do |t|
    t.bigint "source_id"
    t.bigint "term_id"
    t.index ["source_id"], name: "index_sources_terms_on_source_id"
    t.index ["term_id"], name: "index_sources_terms_on_term_id"
  end

  create_table "terms", force: :cascade do |t|
    t.string "label"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
end
