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

ActiveRecord::Schema.define(version: 20190905032943) do

  create_table "addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "address_last_name",                   null: false
    t.string   "address_first_name",                  null: false
    t.string   "address_last_name_kana",              null: false
    t.string   "address_first_name_kana",             null: false
    t.string   "address_number",                      null: false
    t.integer  "address_prefecture",      default: 0, null: false
    t.string   "address_name",                        null: false
    t.string   "address_block",                       null: false
    t.string   "address_building"
    t.integer  "address_phone_number"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user",        null: false
    t.string   "customer_id", null: false
    t.string   "card_id",     null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "ancestry"
    t.index ["ancestry"], name: "index_categories_on_ancestry", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",                        null: false
    t.string   "image",                       null: false
    t.text     "description",   limit: 65535, null: false
    t.integer  "category_id"
    t.string   "state",                       null: false
    t.string   "size"
    t.string   "brand"
    t.string   "postage",                     null: false
    t.string   "region",                      null: false
    t.string   "shipping_date",               null: false
    t.integer  "price",                       null: false
    t.integer  "seller_id"
    t.integer  "buyer_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                            null: false
    t.string   "email",                               null: false
    t.string   "last_name",                           null: false
    t.string   "first_name",                          null: false
    t.string   "last_name_kana",                      null: false
    t.string   "first_name_kana",                     null: false
    t.integer  "birthdate_year",                      null: false
    t.integer  "birthdate_month",                     null: false
    t.integer  "birthdate_day",                       null: false
    t.integer  "phone_number",                        null: false
    t.string   "address_last_name",                   null: false
    t.string   "address_first_name",                  null: false
    t.string   "address_last_name_kana",              null: false
    t.string   "address_first_name_kana",             null: false
    t.string   "address_number",                      null: false
    t.integer  "address_prefecture",      default: 0, null: false
    t.string   "address_name",                        null: false
    t.string   "address_block",                       null: false
    t.string   "address_building"
    t.integer  "address_phone_number"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "items", "categories"
end
