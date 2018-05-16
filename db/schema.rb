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

ActiveRecord::Schema.define(version: 2018_05_16_224124) do

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.text "desc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clubs_hashtags", id: false, force: :cascade do |t|
    t.integer "club_id", null: false
    t.integer "hashtag_id", null: false
    t.index ["club_id", "hashtag_id"], name: "index_clubs_hashtags_on_club_id_and_hashtag_id"
    t.index ["hashtag_id", "club_id"], name: "index_clubs_hashtags_on_hashtag_id_and_club_id"
  end

  create_table "hashtags", force: :cascade do |t|
    t.string "hashtag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
