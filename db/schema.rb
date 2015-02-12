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

ActiveRecord::Schema.define(version: 20150205091152) do

  create_table "activities", force: :cascade do |t|
    t.integer  "type"
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "subject_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "activities", ["course_id"], name: "index_activities_on_course_id"
  add_index "activities", ["subject_id"], name: "index_activities_on_subject_id"
  add_index "activities", ["task_id"], name: "index_activities_on_task_id"
  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "course_subjects", force: :cascade do |t|
    t.date     "begin"
    t.date     "end"
    t.integer  "course_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "course_subjects", ["course_id"], name: "index_course_subjects_on_course_id"
  add_index "course_subjects", ["subject_id"], name: "index_course_subjects_on_subject_id"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "begin"
    t.date     "end"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "enrollment_subjects", force: :cascade do |t|
    t.boolean  "status"
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enrollment_subjects", ["course_id"], name: "index_enrollment_subjects_on_course_id"
  add_index "enrollment_subjects", ["subject_id"], name: "index_enrollment_subjects_on_subject_id"
  add_index "enrollment_subjects", ["user_id"], name: "index_enrollment_subjects_on_user_id"

  create_table "enrollment_tasks", force: :cascade do |t|
    t.date     "begin"
    t.date     "end"
    t.boolean  "status"
    t.integer  "user_id"
    t.integer  "course_id"
    t.integer  "subject_id"
    t.integer  "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enrollment_tasks", ["course_id"], name: "index_enrollment_tasks_on_course_id"
  add_index "enrollment_tasks", ["subject_id"], name: "index_enrollment_tasks_on_subject_id"
  add_index "enrollment_tasks", ["task_id"], name: "index_enrollment_tasks_on_task_id"
  add_index "enrollment_tasks", ["user_id"], name: "index_enrollment_tasks_on_user_id"

  create_table "enrollments", force: :cascade do |t|
    t.boolean  "status"
    t.integer  "user_id"
    t.integer  "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "enrollments", ["course_id"], name: "index_enrollments_on_course_id"
  add_index "enrollments", ["user_id"], name: "index_enrollments_on_user_id"

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "subject_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "tasks", ["subject_id"], name: "index_tasks_on_subject_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "suppervisor"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
