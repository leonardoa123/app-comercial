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

ActiveRecord::Schema[7.0].define(version: 2022_08_31_212326) do
  create_table "categories", force: :cascade do |t|
    t.string "nombre"
    t.string "descripcion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.string "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "imagen"
    t.string "nombre"
    t.string "descripcion"
    t.integer "existencia"
    t.decimal "precio"
    t.integer "categories_id", null: false
    t.integer "suppliers_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categories_id"], name: "index_products_on_categories_id"
    t.index ["suppliers_id"], name: "index_products_on_suppliers_id"
  end

  create_table "sales", force: :cascade do |t|
    t.decimal "importe"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.string "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "warehouse_records", force: :cascade do |t|
    t.integer "cantidad"
    t.integer "urer_id"
    t.integer "supplier_id", null: false
    t.integer "product_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_warehouse_records_on_product_id"
    t.index ["supplier_id"], name: "index_warehouse_records_on_supplier_id"
  end

  add_foreign_key "products", "categories", column: "categories_id"
  add_foreign_key "products", "suppliers", column: "suppliers_id"
  add_foreign_key "warehouse_records", "products"
  add_foreign_key "warehouse_records", "suppliers"
end
