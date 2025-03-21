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

ActiveRecord::Schema[8.0].define(version: 2025_03_18_113406) do
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

  create_table "apartments", force: :cascade do |t|
    t.integer "bedroom_count", default: 1, null: false
    t.integer "bathroom_count", default: 1, null: false
    t.string "floor", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id", null: false
    t.index ["property_id"], name: "index_apartments_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "region", null: false
    t.string "city", null: false
    t.string "address", null: false
    t.string "zip_code", null: false
    t.decimal "size", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.integer "status", null: false
    t.json "amenities", default: []
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.string "property_type", null: false
    t.index ["user_id"], name: "index_properties_on_user_id"
  end

  create_table "townhouses", force: :cascade do |t|
    t.integer "floors", default: 2, null: false
    t.integer "bedroom_count", default: 1, null: false
    t.integer "bathroom_count", default: 1, null: false
    t.integer "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_townhouses_on_property_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "villas", force: :cascade do |t|
    t.integer "bedroom_count", default: 1, null: false
    t.integer "bathroom_count", default: 1, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "property_id", null: false
    t.index ["property_id"], name: "index_villas_on_property_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "apartments", "properties"
  add_foreign_key "properties", "users"
  add_foreign_key "townhouses", "properties"
  add_foreign_key "villas", "properties"
end
