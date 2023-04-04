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

ActiveRecord::Schema.define(version: 2023_04_04_175528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "b_questions", force: :cascade do |t|
    t.string "question"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "t_questions", force: :cascade do |t|
    t.string "question"
    t.integer "q_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "todos", force: :cascade do |t|
    t.bigint "user_id"
    t.string "item"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_todos_on_user_id"
  end

  create_table "user_b_questions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "b_question_id"
    t.string "answer"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["b_question_id"], name: "index_user_b_questions_on_b_question_id"
    t.index ["user_id"], name: "index_user_b_questions_on_user_id"
  end

  create_table "user_t_questions", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "t_question_id"
    t.string "answer"
    t.integer "status", default: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["t_question_id"], name: "index_user_t_questions_on_t_question_id"
    t.index ["user_id"], name: "index_user_t_questions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "todos", "users"
  add_foreign_key "user_b_questions", "b_questions"
  add_foreign_key "user_b_questions", "users"
  add_foreign_key "user_t_questions", "t_questions"
  add_foreign_key "user_t_questions", "users"
end
