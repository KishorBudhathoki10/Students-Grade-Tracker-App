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

ActiveRecord::Schema.define(version: 20200401185048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grades", force: :cascade do |t|
    t.string   "name"
    t.text     "thumb_image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "listening_enrollments", force: :cascade do |t|
    t.integer  "marks",        default: 0
    t.integer  "student_id"
    t.integer  "listening_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["listening_id"], name: "index_listening_enrollments_on_listening_id", using: :btree
    t.index ["student_id"], name: "index_listening_enrollments_on_student_id", using: :btree
  end

  create_table "listenings", force: :cascade do |t|
    t.string   "title"
    t.integer  "grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_id"], name: "index_listenings_on_grade_id", using: :btree
  end

  create_table "reading_enrollments", force: :cascade do |t|
    t.integer  "marks",      default: 0
    t.integer  "student_id"
    t.integer  "reading_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["reading_id"], name: "index_reading_enrollments_on_reading_id", using: :btree
    t.index ["student_id"], name: "index_reading_enrollments_on_student_id", using: :btree
  end

  create_table "readings", force: :cascade do |t|
    t.text     "title"
    t.integer  "grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_id"], name: "index_readings_on_grade_id", using: :btree
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.integer  "grade_id"
    t.text     "thumb_image"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["grade_id"], name: "index_sections_on_grade_id", using: :btree
  end

  create_table "speaking_enrollments", force: :cascade do |t|
    t.integer  "marks",       default: 0
    t.integer  "student_id"
    t.integer  "speaking_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.index ["speaking_id"], name: "index_speaking_enrollments_on_speaking_id", using: :btree
    t.index ["student_id"], name: "index_speaking_enrollments_on_student_id", using: :btree
  end

  create_table "speakings", force: :cascade do |t|
    t.string   "title"
    t.integer  "grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_id"], name: "index_speakings_on_grade_id", using: :btree
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.text     "family_history"
    t.text     "strengths"
    t.text     "weaknesses"
    t.string   "disabilities"
    t.text     "profile_image"
    t.integer  "section_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["name"], name: "index_students_on_name", unique: true, using: :btree
    t.index ["section_id"], name: "index_students_on_section_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "roles"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "writing_enrollments", force: :cascade do |t|
    t.integer  "marks",      default: 0
    t.integer  "student_id"
    t.integer  "writing_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["student_id"], name: "index_writing_enrollments_on_student_id", using: :btree
    t.index ["writing_id"], name: "index_writing_enrollments_on_writing_id", using: :btree
  end

  create_table "writings", force: :cascade do |t|
    t.string   "title"
    t.integer  "grade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grade_id"], name: "index_writings_on_grade_id", using: :btree
  end

  add_foreign_key "listening_enrollments", "listenings"
  add_foreign_key "listening_enrollments", "students"
  add_foreign_key "listenings", "grades"
  add_foreign_key "reading_enrollments", "readings"
  add_foreign_key "reading_enrollments", "students"
  add_foreign_key "readings", "grades"
  add_foreign_key "sections", "grades"
  add_foreign_key "speaking_enrollments", "speakings"
  add_foreign_key "speaking_enrollments", "students"
  add_foreign_key "speakings", "grades"
  add_foreign_key "students", "sections"
  add_foreign_key "writing_enrollments", "students"
  add_foreign_key "writing_enrollments", "writings"
  add_foreign_key "writings", "grades"
end
