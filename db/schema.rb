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

ActiveRecord::Schema.define(version: 20170405011411) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "friends", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "friend_id"
    t.index ["user_id"], name: "index_friends_on_user_id", using: :btree
  end

  create_table "friendships", force: :cascade do |t|
    t.string   "friendable_type"
    t.integer  "friendable_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blocker_id"
    t.integer  "status"
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "share_id"
    t.boolean  "is_up"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["share_id"], name: "index_likes_on_share_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "search_caches", force: :cascade do |t|
    t.string   "search_term"
    t.text     "result"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["search_term"], name: "index_search_caches_on_search_term", using: :btree
  end

  create_table "shares", force: :cascade do |t|
    t.string   "title"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "artist"
    t.integer  "song_id"
    t.string   "aasm_state"
    t.index ["song_id"], name: "index_shares_on_song_id", using: :btree
    t.index ["user_id"], name: "index_shares_on_user_id", using: :btree
  end

  create_table "songs", force: :cascade do |t|
    t.string   "artist"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist"], name: "index_songs_on_artist", using: :btree
    t.index ["name"], name: "index_songs_on_name", using: :btree
  end

  create_table "user_search_histories", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "search_term"
    t.boolean  "success"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["search_term"], name: "index_user_search_histories_on_search_term", using: :btree
    t.index ["user_id"], name: "index_user_search_histories_on_user_id", using: :btree
  end

  create_table "user_shares", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "share_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "aasm_state"
    t.index ["share_id"], name: "index_user_shares_on_share_id", using: :btree
    t.index ["user_id"], name: "index_user_shares_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.text     "spotify_hash"
    t.string   "provider"
    t.index ["email"], name: "index_users_on_email", using: :btree
  end

  add_foreign_key "friends", "users"
  add_foreign_key "friends", "users", column: "friend_id", on_delete: :cascade
  add_foreign_key "likes", "shares"
  add_foreign_key "likes", "users"
  add_foreign_key "shares", "songs"
  add_foreign_key "shares", "users"
  add_foreign_key "user_search_histories", "users"
  add_foreign_key "user_shares", "shares"
  add_foreign_key "user_shares", "users"
end
