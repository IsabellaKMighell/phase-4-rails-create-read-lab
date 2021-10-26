# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_26_130930) do

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.string "image"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transferrable_transactions", force: :cascade do |t|
    t.integer "transactor_id", null: false
    t.integer "transactee_id", null: false
    t.float "cost"
    t.string "category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transactee_id"], name: "index_transferrable_transactions_on_transactee_id"
    t.index ["transactor_id"], name: "index_transferrable_transactions_on_transactor_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.float "total"
    t.integer "transactor_id"
    t.integer "transactee_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transactee_id"], name: "index_users_on_transactee_id"
    t.index ["transactor_id"], name: "index_users_on_transactor_id"
  end

  add_foreign_key "transferrable_transactions", "transactees"
  add_foreign_key "transferrable_transactions", "transactors"
  add_foreign_key "users", "users", column: "transactee_id"
  add_foreign_key "users", "users", column: "transactor_id"
end
