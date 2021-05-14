# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_14_174036) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "careers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "courses", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "id_types", force: :cascade do |t|
    t.integer "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_id_types_on_name", unique: true
  end

  create_table "periods", force: :cascade do |t|
    t.string "name"
    t.date "start"
    t.date "finish"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_periods_on_name", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_roles_on_name", unique: true
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.integer "trimester"
    t.integer "shift"
    t.bigint "course_id", null: false
    t.bigint "period_id", null: false
    t.bigint "career_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["career_id"], name: "index_sections_on_career_id"
    t.index ["course_id"], name: "index_sections_on_course_id"
    t.index ["period_id"], name: "index_sections_on_period_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.integer "curricular_units"
    t.integer "duration"
    t.integer "subject_type"
    t.boolean "status", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "career_id", null: false
    t.index ["career_id"], name: "index_subjects_on_career_id"
    t.index ["course_id"], name: "index_subjects_on_course_id"
  end

  create_table "teacher_careers", force: :cascade do |t|
    t.bigint "teacher_id", null: false
    t.bigint "career_id", null: false
    t.text "observation"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["career_id"], name: "index_teacher_careers_on_career_id"
    t.index ["teacher_id"], name: "index_teacher_careers_on_teacher_id"
  end

  create_table "teacher_degrees", force: :cascade do |t|
    t.string "name"
    t.integer "degree_type"
    t.boolean "status"
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["teacher_id"], name: "index_teacher_degrees_on_teacher_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.bigint "id_type_id", null: false
    t.string "id_number"
    t.string "name"
    t.string "surname"
    t.date "birth_date"
    t.text "obsevation"
    t.date "hire_date"
    t.date "ordinary_date"
    t.boolean "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id_type_id"], name: "index_teachers_on_id_type_id"
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "sections", "careers"
  add_foreign_key "sections", "courses"
  add_foreign_key "sections", "periods"
  add_foreign_key "subjects", "careers"
  add_foreign_key "subjects", "courses"
  add_foreign_key "teacher_careers", "careers"
  add_foreign_key "teacher_careers", "teachers"
  add_foreign_key "teacher_degrees", "teachers"
  add_foreign_key "teachers", "id_types"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
