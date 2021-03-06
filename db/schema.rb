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

ActiveRecord::Schema.define(version: 20141125175238) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "account_type"
  end

  create_table "answers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "entry"
    t.integer  "account_id"
    t.integer  "question_id"
  end

  create_table "feeds", force: true do |t|
    t.string   "tag"
    t.string   "name"
    t.boolean  "private"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "primary"
  end

  add_index "feeds", ["account_id"], name: "index_feeds_on_account_id", using: :btree

  create_table "question_banks", force: true do |t|
    t.integer  "question_id"
    t.integer  "feed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "question_banks", ["feed_id"], name: "index_question_banks_on_feed_id", using: :btree

  create_table "questions", force: true do |t|
    t.string   "entry"
    t.string   "keywords"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id"
    t.integer  "rating"
  end

  create_table "votes", force: true do |t|
    t.integer  "answer_id"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["account_id"], name: "index_votes_on_account_id", using: :btree
  add_index "votes", ["answer_id"], name: "index_votes_on_answer_id", using: :btree

end
