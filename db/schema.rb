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

ActiveRecord::Schema[8.0].define(version: 2026_07_27_095504) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "phone"
    t.string "city"
    t.boolean "vip", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city"], name: "index_customers_on_city"
    t.index ["name"], name: "index_customers_on_name"
    t.index ["phone"], name: "index_customers_on_phone", unique: true
    t.index ["vip"], name: "index_customers_on_vip"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.string "product_name"
    t.integer "quantity"
    t.decimal "price", precision: 10, scale: 2, null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id", "status"], name: "index_orders_on_customer_id_and_status"
    t.index ["customer_id"], name: "index_orders_on_customer_id"
    t.index ["product_name"], name: "index_orders_on_product_name"
    t.index ["status"], name: "index_orders_on_status"
  end

  add_foreign_key "orders", "customers"
end
