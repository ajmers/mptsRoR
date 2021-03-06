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

ActiveRecord::Schema.define(version: 20131223044946) do

  create_table "activities", force: true do |t|
    t.text     "content"
    t.integer  "num_times_ranked"
    t.decimal  "avg_score"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", force: true do |t|
    t.integer  "activity_id"
    t.integer  "rater_id"
    t.integer  "rating"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "creator_id"
  end

  add_index "ratings", ["activity_id", "rater_id"], name: "index_ratings_on_activity_id_and_rater_id", unique: true
  add_index "ratings", ["activity_id"], name: "index_ratings_on_activity_id"
  add_index "ratings", ["rater_id"], name: "index_ratings_on_rater_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.decimal  "points_won"
    t.decimal  "partic_points"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
