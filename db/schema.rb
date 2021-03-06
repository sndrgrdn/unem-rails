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

ActiveRecord::Schema.define(version: 20161216105220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_trgm"

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.index ["slug"], name: "index_cities_on_slug", unique: true, using: :btree
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name"
    t.decimal  "price"
    t.integer  "menu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_id"], name: "index_dishes_on_menu_id", using: :btree
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.integer  "dish_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_ingredients_on_dish_id", using: :btree
  end

  create_table "menu_type_searches", force: :cascade do |t|
    t.string   "searchable"
    t.integer  "menu_type_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["menu_type_id"], name: "index_menu_type_searches_on_menu_type_id", using: :btree
    t.index ["searchable"], name: "index_menu_type_searches_on_searchable", using: :btree
  end

  create_table "menu_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.integer  "restaurant_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "slug"
    t.integer  "menu_type_id"
    t.index ["menu_type_id"], name: "index_menus_on_menu_type_id", using: :btree
    t.index ["restaurant_id", "slug"], name: "index_menus_on_restaurant_id_and_slug", unique: true, using: :btree
    t.index ["restaurant_id"], name: "index_menus_on_restaurant_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
    t.string   "name"
    t.string   "website"
    t.string   "facebook"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.string   "image_uid"
    t.string   "image_name"
    t.index ["city_id", "slug"], name: "index_restaurants_on_city_id_and_slug", unique: true, using: :btree
    t.index ["city_id"], name: "index_restaurants_on_city_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "menu_type_searches", "menu_types"
  add_foreign_key "menus", "menu_types"
end
