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

ActiveRecord::Schema[7.0].define(version: 2023_12_12_131612) do
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

  create_table "agents", force: :cascade do |t|
    t.string "number"
    t.bigint "company_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "introduction_message"
    t.text "custom_instruction"
    t.datetime "deleted_at"
    t.integer "bot_type"
    t.string "calendly_url"
    t.string "calendly_event_uuid"
    t.json "available_spots"
    t.string "voice_id"
    t.string "sid"
    t.string "language"
    t.string "voicemail_message"
    t.string "llm_model", default: "gpt-3.5-turbo"
    t.index ["company_id"], name: "index_agents_on_company_id"
  end

  create_table "cached_voices", force: :cascade do |t|
    t.string "voice_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "campaigns", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.bigint "agent_id"
    t.index ["company_id"], name: "index_campaigns_on_company_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "call_sid"
    t.string "from"
    t.string "to"
    t.integer "company_id"
    t.datetime "deleted_at"
    t.string "recording_url"
    t.bigint "customer_id"
    t.bigint "agent_id"
    t.index ["company_id"], name: "index_conversations_on_company_id"
  end

  create_table "customer_campaigns", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "campaign_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["campaign_id"], name: "index_customer_campaigns_on_campaign_id"
    t.index ["customer_id"], name: "index_customer_campaigns_on_customer_id"
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "campaign_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "flexible_attributes"
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "number"
    t.string "full_name"
    t.bigint "company_id", null: false
    t.datetime "deleted_at", precision: nil
    t.index ["campaign_id"], name: "index_customers_on_campaign_id"
    t.index ["company_id"], name: "index_customers_on_company_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.integer "user_type"
    t.bigint "conversation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id", null: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "agents", "companies"
  add_foreign_key "campaigns", "companies"
  add_foreign_key "customer_campaigns", "campaigns"
  add_foreign_key "customer_campaigns", "customers"
  add_foreign_key "customers", "campaigns"
  add_foreign_key "customers", "companies"
  add_foreign_key "messages", "conversations"
  add_foreign_key "users", "companies"
end
