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

ActiveRecord::Schema.define(version: 2021_05_18_215711) do

  create_table "accounts", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "departments", primary_key: "department_id", id: { type: :string, limit: 20 }, charset: "utf8mb4", force: :cascade do |t|
    t.string "department_name", limit: 20, null: false
  end

  create_table "employees", primary_key: "employee_id", id: :string, charset: "utf8mb4", force: :cascade do |t|
    t.string "name", limit: 50
    t.integer "age"
    t.string "gender", limit: 1
    t.integer "photo_id"
    t.string "zip_number", limit: 20
    t.string "pref", limit: 20
    t.string "address1", limit: 100
    t.string "address2", limit: 100
    t.string "address3", limit: 100
    t.string "department_id"
    t.datetime "hire_date"
    t.datetime "retire_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["department_id"], name: "fk_rails_0025f65a97"
    t.index ["photo_id"], name: "fk_rails_bc108a363f"
  end

  create_table "photos", primary_key: "photo_id", id: :integer, charset: "utf8mb4", force: :cascade do |t|
    t.string "mime_type"
    t.binary "photo_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "employees", "departments", primary_key: "department_id"
  add_foreign_key "employees", "photos", primary_key: "photo_id", on_delete: :cascade
end
