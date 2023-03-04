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

ActiveRecord::Schema[7.0].define(version: 2023_03_03_193415) do
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

  create_table "announcements", force: :cascade do |t|
    t.datetime "published_at"
    t.string "announcement_type"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "city_states", force: :cascade do |t|
    t.string "city"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "country"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "listings", force: :cascade do |t|
    t.string "title"
    t.string "address_line1"
    t.string "address_line2"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "location_photos", force: :cascade do |t|
    t.text "fetched_url"
    t.integer "height"
    t.integer "width"
    t.text "html_attributions"
    t.text "photo_reference"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_photos_on_location_id"
  end

  create_table "location_reviews", force: :cascade do |t|
    t.string "author_name"
    t.string "author_url"
    t.string "profile_url"
    t.integer "rating"
    t.string "text"
    t.integer "time"
    t.string "type"
    t.string "online_source"
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["location_id"], name: "index_location_reviews_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "street_number"
    t.string "street"
    t.string "postal_code"
    t.string "city"
    t.string "country"
    t.string "formatted_address"
    t.string "formatted_phone_number"
    t.string "international_phone_number"
    t.decimal "lat", precision: 10, scale: 6
    t.decimal "lng", precision: 10, scale: 6
    t.string "name"
    t.string "permanently_closed"
    t.string "photos"
    t.string "place_id"
    t.float "rating"
    t.string "types", default: [], array: true
    t.string "region"
    t.string "google_url"
    t.string "vicinity"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "online_source"
    t.string "state"
    t.integer "level_one_charger_count"
    t.integer "level_two_charger_count"
    t.integer "dc_fast_charger_count"
    t.string "ev_network"
    t.string "ev_network_web"
    t.string "hours"
    t.string "owner_type_code"
    t.integer "cached_scoped_like_votes_total", default: 0
    t.integer "cached_scoped_like_votes_score", default: 0
    t.integer "cached_scoped_like_votes_up", default: 0
    t.integer "cached_scoped_like_votes_down", default: 0
    t.integer "cached_weighted_like_score", default: 0
    t.integer "cached_weighted_like_total", default: 0
    t.float "cached_weighted_like_average", default: 0.0
    t.index ["city"], name: "index_locations_on_city"
    t.index ["state"], name: "index_locations_on_state"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "nrel_locations", force: :cascade do |t|
    t.string "access_code"
    t.string "hours"
    t.string "access_detail_code"
    t.string "cards_accepted"
    t.datetime "date_last_confirmed"
    t.datetime "expected_date"
    t.string "fuel_type_code"
    t.string "groups_with_access_code"
    t.integer "api_id"
    t.datetime "open_date"
    t.string "owner_type_code"
    t.string "status_code"
    t.string "restricted_access"
    t.string "name"
    t.string "phone"
    t.datetime "nrel_updated_at"
    t.string "facility_type"
    t.string "geocode_status"
    t.decimal "latitude", precision: 10, scale: 6
    t.decimal "longitude", precision: 10, scale: 6
    t.string "city"
    t.string "intersection_directions"
    t.string "plus4"
    t.string "state"
    t.string "street_address"
    t.string "zip"
    t.string "country"
    t.string "bd_blends"
    t.string "cng_dispenser_num"
    t.string "cng_fill_type_code"
    t.string "cng_psi"
    t.string "cng_renewable_source"
    t.string "cng_total_compression"
    t.string "cng_total_storage"
    t.string "cng_vehicle_class"
    t.string "e85_blender_pump"
    t.string "e85_other_ethanol_blends"
    t.string "ev_connector_types", default: [], array: true
    t.string "ev_dc_fast_num"
    t.string "ev_level1_evse_num"
    t.integer "ev_level2_evse_num"
    t.string "ev_network"
    t.string "ev_network_web"
    t.string "ev_other_evse"
    t.string "ev_pricing"
    t.jsonb "ev_network_ids", default: {}
    t.string "ev_renewable_source"
    t.string "hy_is_retail"
    t.string "hy_pressures"
    t.string "hy_standards"
    t.string "hy_status_link"
    t.string "lng_renewable_source"
    t.string "lng_vehicle_class"
    t.string "lpg_primary"
    t.string "lpg_nozzle_types"
    t.string "ng_fill_type_code"
    t.string "ng_psi"
    t.string "ng_vehicle_class"
    t.string "rd_blends"
    t.string "rd_blends_fr"
    t.string "rd_blended_with_biodiesel"
    t.string "rd_max_biodiesel_level"
    t.string "access_days_time_fr"
    t.string "intersection_directions_fr"
    t.string "bd_blends_fr"
    t.string "groups_with_access_code_fr"
    t.string "ev_pricing_fr"
    t.float "distance"
    t.float "distance_km"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider"
    t.string "uid"
    t.string "access_token"
    t.string "access_token_secret"
    t.string "refresh_token"
    t.datetime "expires_at"
    t.text "auth"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_services_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.datetime "announcements_last_read_at"
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "visits", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "location_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "comment"
    t.index ["location_id"], name: "index_visits_on_location_id"
    t.index ["user_id"], name: "index_visits_on_user_id"
  end

  create_table "votes", force: :cascade do |t|
    t.string "votable_type"
    t.bigint "votable_id"
    t.string "voter_type"
    t.bigint "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["votable_type", "votable_id"], name: "index_votes_on_votable"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
    t.index ["voter_type", "voter_id"], name: "index_votes_on_voter"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "location_photos", "locations"
  add_foreign_key "location_reviews", "locations"
  add_foreign_key "services", "users"
  add_foreign_key "visits", "locations"
  add_foreign_key "visits", "users"
end
