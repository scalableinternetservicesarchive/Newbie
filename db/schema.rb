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

ActiveRecord::Schema.define(version: 20150523005840) do

  create_table "comments", force: :cascade do |t|
    t.integer  "post_id",          limit: 4
    t.integer  "user_id",          limit: 4
    t.text     "content",          limit: 65535
    t.datetime "datetime"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
    t.boolean  "read",             limit: 1,     default: false
    t.integer  "replyToCommentID", limit: 4
  end

  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "favorite_posts", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "favorite_posts", ["post_id"], name: "index_favorite_posts_on_post_id", using: :btree
  add_index "favorite_posts", ["user_id"], name: "index_favorite_posts_on_user_id", using: :btree

  create_table "pictures", force: :cascade do |t|
    t.integer  "post_id",            limit: 4
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "pictures", ["post_id"], name: "index_pictures_on_post_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.integer  "user_id",                 limit: 4
    t.string   "title",                   limit: 255
    t.datetime "datetime"
    t.text     "content",                 limit: 65535
    t.string   "image_url",               limit: 255
    t.string   "post_image_file_name",    limit: 255
    t.string   "post_image_content_type", limit: 255
    t.integer  "post_image_file_size",    limit: 4
    t.datetime "post_image_updated_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "latitude",                limit: 255
    t.string   "longitude",               limit: 255
    t.integer  "downvote_number",         limit: 4,     default: 0
    t.integer  "upvote_number",           limit: 4,     default: 0
    t.string   "image_file_name",         limit: 255
    t.string   "image_content_type",      limit: 255
    t.integer  "image_file_size",         limit: 4
    t.datetime "image_updated_at"
    t.string   "address",                 limit: 255
    t.string   "ip_address",              limit: 255
  end

  add_index "posts", ["created_at"], name: "index_posts_on_created_at", using: :btree
  add_index "posts", ["user_id"], name: "index_posts_on_user_id", using: :btree

  create_table "readcomments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "comment_id", limit: 4
    t.boolean  "to_post",    limit: 1
    t.integer  "reply_toid", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "readcomments", ["comment_id"], name: "index_readcomments_on_comment_id", using: :btree
  add_index "readcomments", ["reply_toid"], name: "index_readcomments_on_reply_toid", using: :btree
  add_index "readcomments", ["user_id"], name: "index_readcomments_on_user_id", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "unreadcomments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "comment_id", limit: 4
    t.boolean  "to_post",    limit: 1
    t.integer  "reply_toid", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "unreadcomments", ["comment_id"], name: "index_unreadcomments_on_comment_id", using: :btree
  add_index "unreadcomments", ["reply_toid"], name: "index_unreadcomments_on_reply_toid", using: :btree
  add_index "unreadcomments", ["user_id"], name: "index_unreadcomments_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "user_name",              limit: 255
    t.string   "gender",                 limit: 255
    t.integer  "unread",                 limit: 4,   default: 0,  null: false
    t.datetime "birthday"
    t.string   "location",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "post_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.boolean  "label",      limit: 1
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "votes", ["post_id"], name: "index_votes_on_post_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
