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

ActiveRecord::Schema.define(version: 20170509062730) do

  create_table "blacklists", force: :cascade do |t|
    t.string "license", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["license"], name: "index_blacklists_on_license"
  end

  create_table "charges", force: :cascade do |t|
    t.text "description"
    t.decimal "amount", precision: 8, scale: 2, default: "0.0", null: false
    t.integer "wash_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_credit", default: false, null: false
    t.index ["wash_id"], name: "index_charges_on_wash_id"
  end

  create_table "ownerships", force: :cascade do |t|
    t.integer "user_id"
    t.integer "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_ownerships_on_user_id"
    t.index ["vehicle_id"], name: "index_ownerships_on_vehicle_id"
  end

  create_table "users", force: :cascade do |t|
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.integer "vehicle_type"
    t.string "license", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["license"], name: "index_vehicles_on_license"
  end

  create_table "washes", force: :cascade do |t|
    t.integer "vehicle_id"
    t.decimal "total", precision: 8, scale: 2, default: "0.0", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.string "license"
    t.string "vehicle_type"
    t.index ["user_id"], name: "index_washes_on_user_id"
    t.index ["vehicle_id"], name: "index_washes_on_vehicle_id"
  end

end
