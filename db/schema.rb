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

ActiveRecord::Schema.define(version: 20210123180255) do

  create_table "cameras", force: :cascade do |t|
    t.integer  "type",       limit: 4
    t.integer  "postion",    limit: 4
    t.integer  "pixel",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "model_id",   limit: 4
  end

  add_index "cameras", ["model_id"], name: "index_cameras_on_model_id", using: :btree

  create_table "manufacturers", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.integer  "year_of_establishment", limit: 4
    t.string   "parent_company",        limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "models", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.text     "description",         limit: 65535
    t.integer  "selling_price",       limit: 4
    t.integer  "year_of_release",     limit: 4
    t.string   "usb_type",            limit: 255
    t.integer  "battery_capacity",    limit: 4
    t.integer  "height",              limit: 4
    t.integer  "width",               limit: 4
    t.string   "sim_type",            limit: 255
    t.string   "colour",              limit: 255
    t.string   "network_supported",   limit: 255
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.integer  "manufacturer_id",     limit: 4
    t.integer  "storage_id",          limit: 4
    t.integer  "processor_id",        limit: 4
    t.integer  "operating_system_id", limit: 4
  end

  add_index "models", ["manufacturer_id"], name: "index_models_on_manufacturer_id", using: :btree
  add_index "models", ["operating_system_id"], name: "index_models_on_operating_system_id", using: :btree
  add_index "models", ["processor_id"], name: "index_models_on_processor_id", using: :btree
  add_index "models", ["storage_id"], name: "index_models_on_storage_id", using: :btree

  create_table "operating_systems", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "company",    limit: 255
    t.float    "version",    limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "processors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "company",    limit: 255
    t.integer  "speed",      limit: 4
    t.string   "os_name",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "storages", force: :cascade do |t|
    t.integer  "primary",     limit: 4
    t.integer  "secondary",   limit: 4
    t.integer  "extended",    limit: 4
    t.string   "memory_card", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_foreign_key "cameras", "models"
  add_foreign_key "models", "manufacturers"
  add_foreign_key "models", "operating_systems"
  add_foreign_key "models", "processors"
  add_foreign_key "models", "storages"
end
