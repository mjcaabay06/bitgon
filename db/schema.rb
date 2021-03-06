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

ActiveRecord::Schema.define(version: 20171013184214) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "article_categories", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "article_platforms", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "article_tags", force: :cascade do |t|
    t.integer  "article_id"
    t.string   "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "article_tags", ["article_id"], name: "index_article_tags_on_article_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "article_url"
    t.string   "image_url"
    t.string   "title"
    t.string   "synopsis"
    t.integer  "article_category_id"
    t.integer  "article_platform_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.boolean  "published"
  end

  add_index "articles", ["article_category_id"], name: "index_articles_on_article_category_id", using: :btree
  add_index "articles", ["article_platform_id"], name: "index_articles_on_article_platform_id", using: :btree
  add_index "articles", ["user_id"], name: "index_articles_on_user_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_infos", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_infos", ["user_id"], name: "index_user_infos_on_user_id", using: :btree

  create_table "user_roles", force: :cascade do |t|
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email_address"
    t.string   "password"
    t.integer  "user_role_id"
    t.integer  "status_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "users", ["status_id"], name: "index_users_on_status_id", using: :btree
  add_index "users", ["user_role_id"], name: "index_users_on_user_role_id", using: :btree

  add_foreign_key "article_tags", "articles"
  add_foreign_key "articles", "article_categories"
  add_foreign_key "articles", "article_platforms"
  add_foreign_key "articles", "users"
  add_foreign_key "user_infos", "users"
  add_foreign_key "users", "statuses"
  add_foreign_key "users", "user_roles"
end
