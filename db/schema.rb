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

ActiveRecord::Schema.define(version: 20150302091807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diagnoses", force: :cascade do |t|
    t.string "name"
    t.text   "description"
  end

  add_index "diagnoses", ["name"], name: "index_diagnoses_on_name", unique: true, using: :btree

  create_table "patients", force: :cascade do |t|
    t.integer  "clinic_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "patronymic"
    t.datetime "dob"
    t.string   "email"
    t.string   "phone"
    t.text     "diagnosis"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "patients", ["clinic_id"], name: "index_patients_on_clinic_id", using: :btree
  add_index "patients", ["email"], name: "index_patients_on_email", unique: true, using: :btree
  add_index "patients", ["first_name"], name: "index_patients_on_first_name", using: :btree
  add_index "patients", ["last_name"], name: "index_patients_on_last_name", using: :btree
  add_index "patients", ["phone"], name: "index_patients_on_phone", unique: true, using: :btree

end
