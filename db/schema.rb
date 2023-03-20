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

ActiveRecord::Schema[7.0].define(version: 2023_03_18_172331) do
  create_table "employments", force: :cascade do |t|
    t.string "employer", null: false
    t.date "date_started", null: false
    t.date "date_ended", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_employments_on_user_id"
  end

  create_table "personal_data", force: :cascade do |t|
    t.string "first_name", limit: 25
    t.string "last_name", limit: 50
    t.string "nickname", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "employment_id"
    t.integer "user_id"
    t.index ["email"], name: "index_personal_data_on_email"
    t.index ["employment_id"], name: "index_personal_data_on_employment_id"
    t.index ["first_name"], name: "index_personal_data_on_first_name"
    t.index ["last_name"], name: "index_personal_data_on_last_name"
    t.index ["phone"], name: "index_personal_data_on_phone"
    t.index ["user_id"], name: "index_personal_data_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "employments", "users"
  add_foreign_key "personal_data", "employments"
  add_foreign_key "personal_data", "users"
end
