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

ActiveRecord::Schema.define(version: 20171117014214) do

  create_table "labels", force: :cascade do |t|
    t.string "name"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "liker_id"
    t.integer "likee_id"
    t.index ["liker_id", "likee_id"], name: "index_likes_on_liker_id_and_likee_id", unique: true
  end

  create_table "params", force: :cascade do |t|
    t.string "project_name"
    t.string "app_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "filters"
  end

  create_table "preference_labels", force: :cascade do |t|
    t.integer "preference_id"
    t.integer "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.integer "user_id"
    t.integer "label_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_labels", force: :cascade do |t|
    t.integer "user_id"
    t.integer "label_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "avatar"
    t.string "age_appearance"
    t.string "gender_appearance"
    t.string "multicultural_appearance"
    t.string "demo"
    t.string "cel_demo"
  end

end
