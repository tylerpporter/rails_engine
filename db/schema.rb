
ActiveRecord::Schema.define(version: 20200515204604) do

  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "created_at"
    t.string "updated_at"
  end

  create_table "invoice_items", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "unit_price"
    t.string "created_at"
    t.string "updated_at"
    t.bigint "item_id"
    t.bigint "invoice_id"
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
    t.index ["item_id"], name: "index_invoice_items_on_item_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.string "status"
    t.string "created_at"
    t.string "updated_at"
    t.bigint "customer_id"
    t.bigint "merchant_id"
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
    t.index ["merchant_id"], name: "index_invoices_on_merchant_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.decimal "unit_price"
    t.bigint "merchant_id"
    t.string "created_at"
    t.string "updated_at"
    t.index ["merchant_id"], name: "index_items_on_merchant_id"
  end

  create_table "merchants", force: :cascade do |t|
    t.string "name"
    t.string "created_at"
    t.string "updated_at"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "credit_card_number"
    t.string "credit_card_expiration_date"
    t.string "result"
    t.string "created_at"
    t.string "updated_at"
    t.bigint "invoice_id"
    t.index ["invoice_id"], name: "index_transactions_on_invoice_id"
  end

  add_foreign_key "invoice_items", "invoices"
  add_foreign_key "invoice_items", "items"
  add_foreign_key "invoices", "customers"
  add_foreign_key "invoices", "merchants"
  add_foreign_key "items", "merchants"
  add_foreign_key "transactions", "invoices"
end
