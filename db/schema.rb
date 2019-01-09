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

ActiveRecord::Schema.define(version: 2019_01_09_060218) do

  create_table "cohorts", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "course_id"
  end

  create_table "cohorts_courses", id: false, force: :cascade do |t|
    t.integer "cohort_id", null: false
    t.integer "course_id", null: false
    t.index ["cohort_id", "course_id"], name: "index_cohorts_courses_on_cohort_id_and_course_id"
  end

  create_table "cohorts_users", id: false, force: :cascade do |t|
    t.integer "cohort_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_courses_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "education"
    t.string "email"
    t.string "password"
    t.string "avatar"
    t.boolean "instructor", default: false
    t.integer "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "birthday"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
