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

ActiveRecord::Schema.define(version: 20170810161325) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "body"
    t.string "commentable_type"
    t.bigint "commentable_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "experiments", force: :cascade do |t|
    t.string "title"
    t.string "results"
    t.string "conclusion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "proposal_id"
    t.string "status"
    t.string "username"
    t.index ["proposal_id"], name: "index_experiments_on_proposal_id"
  end

  create_table "observations", force: :cascade do |t|
    t.string "observable_type"
    t.bigint "observable_id"
    t.string "body"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["observable_type", "observable_id"], name: "index_observations_on_observable_type_and_observable_id"
    t.index ["user_id"], name: "index_observations_on_user_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.string "body"
    t.bigint "experiment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["experiment_id"], name: "index_procedures_on_experiment_id"
  end

  create_table "proposals", force: :cascade do |t|
    t.string "title"
    t.string "summary"
    t.string "hypothesis"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_proposals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "users"
  add_foreign_key "experiments", "proposals"
  add_foreign_key "observations", "users"
  add_foreign_key "procedures", "experiments"
  add_foreign_key "proposals", "users"
end
