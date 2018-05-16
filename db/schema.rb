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

ActiveRecord::Schema.define(version: 20180516202957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "analyzes", force: :cascade do |t|
    t.bigint "laboratory_id"
    t.bigint "patient_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["laboratory_id"], name: "index_analyzes_on_laboratory_id"
    t.index ["patient_id"], name: "index_analyzes_on_patient_id"
  end

  create_table "beds", force: :cascade do |t|
    t.integer "bed_number"
    t.bigint "ward_id"
    t.bigint "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_beds_on_patient_id"
    t.index ["ward_id"], name: "index_beds_on_ward_id"
  end

  create_table "blocks", force: :cascade do |t|
    t.bigint "hospital_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hospital_id"], name: "index_blocks_on_hospital_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.string "clinic_type"
    t.bigint "clinic_id"
    t.bigint "laboratory_id"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinic_type", "clinic_id"], name: "index_contracts_on_clinic_type_and_clinic_id"
    t.index ["laboratory_id"], name: "index_contracts_on_laboratory_id"
  end

  create_table "department_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.bigint "block_id"
    t.bigint "department_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["block_id"], name: "index_departments_on_block_id"
    t.index ["department_type_id"], name: "index_departments_on_department_type_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "academic_degree"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "specialty"
    t.integer "level"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.index ["email"], name: "index_employees_on_email", unique: true
    t.index ["reset_password_token"], name: "index_employees_on_reset_password_token", unique: true
  end

  create_table "hospital_staffs", force: :cascade do |t|
    t.bigint "hospital_id"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "hired_at"
    t.date "fired_at"
    t.index ["employee_id"], name: "index_hospital_staffs_on_employee_id"
    t.index ["hospital_id"], name: "index_hospital_staffs_on_hospital_id"
  end

  create_table "hospitals", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "laboratories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_cards", force: :cascade do |t|
    t.string "clinic_type"
    t.bigint "clinic_id"
    t.string "diagnosis"
    t.bigint "employee_id"
    t.bigint "patient_id"
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "operations_success"
    t.integer "operations_fails"
    t.index ["clinic_type", "clinic_id"], name: "index_patient_cards_on_clinic_type_and_clinic_id"
    t.index ["employee_id"], name: "index_patient_cards_on_employee_id"
    t.index ["patient_id"], name: "index_patient_cards_on_patient_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "polyclinic_staffs", force: :cascade do |t|
    t.bigint "polyclinic_id"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "hired_at"
    t.date "fired_at"
    t.index ["employee_id"], name: "index_polyclinic_staffs_on_employee_id"
    t.index ["polyclinic_id"], name: "index_polyclinic_staffs_on_polyclinic_id"
  end

  create_table "polyclinics", force: :cascade do |t|
    t.bigint "hospital_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
    t.index ["hospital_id"], name: "index_polyclinics_on_hospital_id"
  end

  create_table "wards", force: :cascade do |t|
    t.string "name"
    t.bigint "department_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "kind"
    t.integer "employee_id"
    t.index ["department_id"], name: "index_wards_on_department_id"
  end

  add_foreign_key "analyzes", "laboratories"
  add_foreign_key "analyzes", "patients"
  add_foreign_key "beds", "patients"
  add_foreign_key "beds", "wards"
  add_foreign_key "blocks", "hospitals"
  add_foreign_key "contracts", "laboratories"
  add_foreign_key "departments", "blocks"
  add_foreign_key "departments", "department_types"
  add_foreign_key "hospital_staffs", "employees"
  add_foreign_key "hospital_staffs", "hospitals"
  add_foreign_key "patient_cards", "employees"
  add_foreign_key "patient_cards", "patients"
  add_foreign_key "polyclinic_staffs", "employees"
  add_foreign_key "polyclinic_staffs", "polyclinics"
  add_foreign_key "polyclinics", "hospitals"
  add_foreign_key "wards", "departments"
end
