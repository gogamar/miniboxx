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

ActiveRecord::Schema[7.0].define(version: 2024_04_14_060910) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "billing_addresses", force: :cascade do |t|
    t.string "name"
    t.string "vat_number"
    t.string "address_first"
    t.string "address_second"
    t.string "post_code"
    t.string "city"
    t.string "region"
    t.string "country"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_billing_addresses_on_user_id"
  end

  create_table "brands", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "epos_brand_id"
    t.bigint "supplier_id"
    t.index ["supplier_id"], name: "index_brands_on_supplier_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "cart_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["product_id"], name: "index_cart_items_on_product_id"
  end

  create_table "carts", force: :cascade do |t|
    t.string "status"
    t.integer "total_items"
    t.decimal "total_price"
    t.text "notes"
    t.string "session_id"
    t.bigint "user_id"
    t.bigint "discount_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_id"], name: "index_carts_on_discount_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "epos_category_id"
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "color_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discounts", force: :cascade do |t|
    t.string "code"
    t.string "description"
    t.integer "value"
    t.string "discount_type"
    t.date "start_date"
    t.date "end_date"
    t.decimal "min_spend"
    t.integer "max_uses"
    t.integer "usage_count"
    t.boolean "active"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_discounts_on_user_id"
  end

  create_table "image_urls", force: :cascade do |t|
    t.string "url"
    t.integer "position"
    t.integer "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "variant_id"
    t.integer "epos_image_id"
    t.index ["variant_id"], name: "index_image_urls_on_variant_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "price_at_order_time"
    t.bigint "order_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "product_id", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "status"
    t.integer "order_number"
    t.integer "total_items"
    t.decimal "total_price"
    t.text "notes"
    t.string "payment_method"
    t.string "payment_status"
    t.string "shipping_method"
    t.string "shipping_cost"
    t.string "estimated_delivery_date"
    t.string "tracking_number"
    t.bigint "user_id", null: false
    t.bigint "billing_address_id"
    t.bigint "shipping_address_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payment_intent_id"
    t.index ["billing_address_id"], name: "index_orders_on_billing_address_id"
    t.index ["shipping_address_id"], name: "index_orders_on_shipping_address_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "current_stock", default: 0
    t.bigint "variant_id", null: false
    t.bigint "size_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "epos_product_id"
    t.string "barcode"
    t.decimal "sales_price"
    t.index ["size_id"], name: "index_products_on_size_id"
    t.index ["variant_id"], name: "index_products_on_variant_id"
  end

  create_table "shipping_addresses", force: :cascade do |t|
    t.string "name"
    t.string "address_first"
    t.string "address_second"
    t.string "post_code"
    t.string "city"
    t.string "region"
    t.string "country"
    t.string "phone_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_shipping_addresses_on_user_id"
  end

  create_table "sizes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "age"
  end

  create_table "styles", force: :cascade do |t|
    t.integer "style_number"
    t.string "style_name"
    t.text "sales_description_en"
    t.text "quality_description_en"
    t.text "short_description"
    t.string "gender"
    t.string "fit"
    t.text "composition"
    t.string "care_label"
    t.text "wash_care_en"
    t.text "fashion_forward"
    t.bigint "sub_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "sales_description_es"
    t.text "quality_description_es"
    t.text "wash_care_es"
    t.bigint "brand_id"
    t.index ["brand_id"], name: "index_styles_on_brand_id"
    t.index ["sub_category_id"], name: "index_styles_on_sub_category_id"
  end

  create_table "sub_categories", force: :cascade do |t|
    t.string "name"
    t.bigint "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_sub_categories_on_category_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.integer "epos_supplier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "variants", force: :cascade do |t|
    t.string "external_id"
    t.bigint "style_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "color_id"
    t.decimal "wsp_value"
    t.decimal "rrp_value"
    t.decimal "mark_up"
    t.index ["color_id"], name: "index_variants_on_color_id"
    t.index ["style_id"], name: "index_variants_on_style_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "billing_addresses", "users"
  add_foreign_key "brands", "suppliers"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "products"
  add_foreign_key "carts", "discounts"
  add_foreign_key "carts", "users"
  add_foreign_key "discounts", "users"
  add_foreign_key "image_urls", "variants"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "billing_addresses"
  add_foreign_key "orders", "shipping_addresses"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "sizes"
  add_foreign_key "products", "variants"
  add_foreign_key "shipping_addresses", "users"
  add_foreign_key "styles", "brands"
  add_foreign_key "styles", "sub_categories"
  add_foreign_key "sub_categories", "categories"
  add_foreign_key "variants", "colors"
  add_foreign_key "variants", "styles"
end
