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

ActiveRecord::Schema.define(version: 20180421174442) do

  create_table "applications", force: :cascade do |t|
    t.text "text"
    t.datetime "date_added"
    t.integer "group_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_applications_on_group_id"
    t.index ["project_id"], name: "index_applications_on_project_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "club_name"
    t.string "university_name"
    t.string "club_link"
    t.text "description"
    t.string "photo_link"
    t.boolean "verified"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "group_to_students", force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_group_to_students_on_group_id"
    t.index ["user_id"], name: "index_group_to_students_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.integer "club_id"
    t.string "group_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_groups_on_club_id"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "user_id"
    t.string "project_name"
    t.text "description"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "complete"
    t.index ["group_id"], name: "index_projects_on_group_id"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "club_id"
    t.integer "user_id"
    t.text "review_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_reviews_on_club_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "student_to_clubs", force: :cascade do |t|
    t.integer "club_id"
    t.integer "user_id"
    t.boolean "is_admin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["club_id"], name: "index_student_to_clubs_on_club_id"
    t.index ["user_id"], name: "index_student_to_clubs_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.string "password_hash"
    t.string "photo_link"
    t.text "description"
    t.boolean "is_student"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
