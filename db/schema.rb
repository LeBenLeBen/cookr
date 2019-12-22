# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_03_26_155401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", id: :serial, force: :cascade do |t|
    t.integer "recipe_id"
    t.text "amount"
    t.text "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipes", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "steps"
    t.integer "time"
    t.string "notes", limit: 255
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "quantity"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "recipes_tags", id: :serial, force: :cascade do |t|
    t.integer "recipe_id"
    t.integer "tag_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "recipe_count", default: 0
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "author"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "recipes", "users"
end
