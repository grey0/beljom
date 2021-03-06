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

ActiveRecord::Schema.define(version: 20170209192439) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "rating"
    t.integer  "category_id"
    t.integer  "seller_id"
    t.boolean  "approved",       default: false
    t.integer  "approved_by"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "product_images", default: [],                  array: true
    t.integer  "price"
    t.integer  "currency",       default: 0
    t.integer  "condition"
    t.string   "seller_name",    default: "null"
    t.string   "contact",        default: "null"
  end

  create_table "sellers", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone_number"
    t.boolean  "whatsapp"
    t.string   "password_digest"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "remember_digest"
    t.string   "activation_digest"
    t.boolean  "activated"
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.boolean  "admin",             default: false
  end

end
