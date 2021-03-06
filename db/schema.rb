# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20151224051841) do

  create_table "playlists", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string   "artist"
    t.string   "track_name"
    t.string   "preview"
    t.string   "art_work"
    t.string   "genre"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "playlist_id"
    t.integer  "plays",       default: 0
    t.datetime "last_played"
  end

  add_index "songs", ["playlist_id"], name: "index_songs_on_playlist_id"

end
