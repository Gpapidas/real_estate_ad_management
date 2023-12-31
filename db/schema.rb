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

ActiveRecord::Schema[7.0].define(version: 2023_07_23_134709) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "property_ad_locations", force: :cascade do |t|
    t.string "place_id", null: false
    t.string "area_main_text", null: false
    t.string "area_secondary_text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["place_id"], name: "index_property_ad_locations_on_place_id", unique: true
  end

  create_table "property_ads", force: :cascade do |t|
    t.string "title", null: false
    t.string "property_type", null: false
    t.integer "property_ad_location_id", null: false
    t.integer "user_id", null: false
    t.float "price", null: false
    t.string "extra_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "levels"
    t.integer "bathrooms"
    t.string "image"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
