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

ActiveRecord::Schema.define(version: 2019_02_11_165009) do

  create_table "astros", force: :cascade do |t|
    t.string "sign"
    t.string "character"
    t.string "traits"
    t.string "date_start"
    t.string "date_end"
    t.string "color"
    t.string "element"
    t.string "polarity"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "compatabilities", force: :cascade do |t|
    t.integer "score"
    t.text "description"
    t.integer "astro1_id"
    t.integer "astro2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["astro1_id"], name: "index_compatabilities_on_astro1_id"
    t.index ["astro2_id"], name: "index_compatabilities_on_astro2_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer "user1_id"
    t.integer "user2_id"
    t.integer "match_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_matches_on_match_id"
    t.index ["user1_id"], name: "index_matches_on_user1_id"
    t.index ["user2_id"], name: "index_matches_on_user2_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "birthday"
    t.string "photo_filename"
    t.string "email"
    t.string "username"
    t.integer "astro_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["astro_id"], name: "index_users_on_astro_id"
  end

end
