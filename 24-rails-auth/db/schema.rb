ActiveRecord::Schema.define(version: 2018_07_31_170925) do

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "songs", force: :cascade do |t|
    t.string "title"
    t.integer "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["artist_id"], name: "index_songs_on_artist_id"
  end

  create_table "songs_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "song_id"
    t.index ["song_id"], name: "index_songs_users_on_song_id"
    t.index ["user_id"], name: "index_songs_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "profile_photo", default: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9a/Guy_Fieri_at_Guantanamo_2.jpg/220px-Guy_Fieri_at_Guantanamo_2.jpg"
    t.index ["username"], name: "index_users_on_username"
  end

end
