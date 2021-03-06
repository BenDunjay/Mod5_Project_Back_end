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

ActiveRecord::Schema.define(version: 2020_06_09_182250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "email_address"
    t.string "artist_genre"
    t.text "bio"
    t.string "phone_number"
    t.string "instagram"
    t.string "spotify"
    t.string "profile_picture"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "availabilities", force: :cascade do |t|
    t.date "date"
    t.bigint "artist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist_id"], name: "index_availabilities_on_artist_id"
  end

  create_table "requests", force: :cascade do |t|
    t.integer "payment"
    t.integer "number_of_hours"
    t.boolean "accept"
    t.time "start_time"
    t.bigint "venue_id", null: false
    t.bigint "availability_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["availability_id"], name: "index_requests_on_availability_id"
    t.index ["venue_id"], name: "index_requests_on_venue_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "email_address"
    t.string "postcode"
    t.text "bio"
    t.string "website_lin"
    t.string "instagram"
    t.string "phone_number"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "availabilities", "artists"
  add_foreign_key "requests", "availabilities"
  add_foreign_key "requests", "venues"
end
