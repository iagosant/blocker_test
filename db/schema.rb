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

ActiveRecord::Schema.define(version: 20160804144434) do

  create_table "collaborations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "list_id"
    t.datetime "collaboration_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "collaborations", ["list_id"], name: "index_collaborations_on_list_id"
  add_index "collaborations", ["user_id"], name: "index_collaborations_on_user_id"

  create_table "lists", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
  end

  add_index "lists", ["user_id"], name: "index_lists_on_user_id"

  create_table "tasks", force: :cascade do |t|
    t.string   "detail"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "parent_task_id"
    t.integer  "list_id"
    t.integer  "user_id"
  end

  add_index "tasks", ["list_id"], name: "index_tasks_on_list_id"
  add_index "tasks", ["parent_task_id"], name: "index_tasks_on_parent_task_id"
  add_index "tasks", ["user_id"], name: "index_tasks_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
