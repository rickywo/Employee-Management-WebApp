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

ActiveRecord::Schema.define(version: 20160921043339) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendance_types", force: :cascade do |t|
    t.string   "name"
    t.integer  "attendance_rate"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "capitalizable_groups", force: :cascade do |t|
    t.float    "capitalizable_rate"
    t.text     "description"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "capitalization_results", force: :cascade do |t|
    t.string   "project_name"
    t.string   "employee_name"
    t.datetime "date"
    t.float    "hours"
    t.string   "full_project_name"
    t.string   "hourly_rate"
    t.integer  "iteration_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.boolean  "status"
    t.integer  "employment_type"
    t.float    "hourly_rate"
    t.integer  "location"
    t.integer  "leave_days"
    t.integer  "capitalizable_group_id"
    t.datetime "commencement_date"
    t.datetime "termination_date"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "attendance_type_id"
    t.index ["attendance_type_id"], name: "index_employees_on_attendance_type_id", using: :btree
  end

  create_table "history_data", force: :cascade do |t|
    t.text     "iteration_data"
    t.text     "result_data"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "iteration_id"
    t.index ["iteration_id"], name: "index_history_data_on_iteration_id", using: :btree
  end

  create_table "iterations", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "work_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.integer  "status"
    t.boolean  "is_capitalizable"
    t.float    "weight"
    t.datetime "release_date"
    t.text     "description"
    t.integer  "team_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "states", id: false, force: :cascade do |t|
    t.string  "state"
    t.integer "value"
    t.index ["state"], name: "index_states_on_state", unique: true, using: :btree
  end

  create_table "team_members", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "employee_id"
    t.float    "dedication_weight"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.boolean  "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_foreign_key "capitalization_results", "iterations"
  add_foreign_key "employees", "attendance_types"
  add_foreign_key "employees", "capitalizable_groups"
  add_foreign_key "history_data", "iterations"
  add_foreign_key "projects", "teams"
  add_foreign_key "team_members", "employees"
  add_foreign_key "team_members", "teams"
end
