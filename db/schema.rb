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

ActiveRecord::Schema.define(version: 2020_08_30_155133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "member_roles", force: :cascade do |t|
    t.bigint "member_id"
    t.bigint "role_id"
    t.datetime "entry_date"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_member_roles_on_member_id"
    t.index ["role_id"], name: "index_member_roles_on_role_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "team_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["team_id"], name: "index_roles_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.string "initials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "member_roles", "members"
  add_foreign_key "member_roles", "roles"
  add_foreign_key "members", "users"
  add_foreign_key "roles", "teams"
end
