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

ActiveRecord::Schema[7.0].define(version: 2023_02_27_144521) do
  create_table "collaborators", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "profile"
    t.integer "organization_id"
    t.index ["email"], name: "index_collaborators_on_email", unique: true
    t.index ["organization_id"], name: "index_collaborators_on_organization_id"
  end

  create_table "collaborators_todos", id: false, force: :cascade do |t|
    t.integer "collaborator_id"
    t.integer "todo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collaborator_id", "todo_id"], name: "index_collaborators_todos_on_collaborator_id_and_todo_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "project_id", null: false
    t.integer "collaborator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collaborator_id"], name: "index_comments_on_collaborator_id"
    t.index ["project_id"], name: "index_comments_on_project_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "collaborator_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collaborator_id"], name: "index_projects_on_collaborator_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.integer "project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_tasks_on_project_id"
  end

  create_table "todos", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.date "due_on"
    t.boolean "done"
    t.integer "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_todos_on_task_id"
  end

  add_foreign_key "collaborators", "organizations"
  add_foreign_key "comments", "collaborators"
  add_foreign_key "comments", "projects"
  add_foreign_key "projects", "collaborators"
  add_foreign_key "tasks", "projects"
  add_foreign_key "todos", "tasks"
end
