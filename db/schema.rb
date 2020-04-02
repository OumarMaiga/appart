# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_14_031629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caracteristiques", force: :cascade do |t|
    t.string "libelle"
    t.string "icon"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "caracteristiques_locations", id: false, force: :cascade do |t|
    t.bigint "caracteristique_id"
    t.bigint "location_id"
    t.index ["caracteristique_id"], name: "index_caracteristiques_locations_on_caracteristique_id"
    t.index ["location_id"], name: "index_caracteristiques_locations_on_location_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "libelle"
    t.bigint "location_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_images_on_location_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "titre"
    t.text "adresse"
    t.text "description"
    t.boolean "etat"
    t.bigint "prix"
    t.string "duree"
    t.bigint "type_id"
    t.bigint "nombre_adulte"
    t.bigint "nombre_enfant"
    t.bigint "nombre_salon"
    t.bigint "nombre_chamber"
    t.bigint "nombre_toillete"
    t.bigint "user_id", null: false
    t.string "nom_bailleur"
    t.string "email_bailleur"
    t.bigint "telephone_bailleur"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "adresse_bailleur"
    t.text "#<ActiveRecord::ConnectionAdapters::PostgreSQL::TableDefinition"
    t.index ["type_id"], name: "index_locations_on_type_id"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.bigint "reservation_id", null: false
    t.boolean "vue", default: false
    t.string "type_notification"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["reservation_id"], name: "index_notifications_on_reservation_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "location_id", null: false
    t.bigint "user_id"
    t.string "email"
    t.string "nom"
    t.string "prenom"
    t.date "debut"
    t.date "fin"
    t.integer "nombre_adulte"
    t.integer "nombre_enfant"
    t.bigint "montant_paye"
    t.bigint "telephone"
    t.boolean "confirmer", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["location_id"], name: "index_reservations_on_location_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "libelle"
    t.boolean "etat"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["user_id"], name: "index_types_on_user_id"
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
    t.string "nom"
    t.string "prenom"
    t.text "adresse"
    t.bigint "telephone"
    t.string "image"
    t.string "categorie"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "images", "locations"
  add_foreign_key "locations", "types"
  add_foreign_key "locations", "users"
  add_foreign_key "notifications", "reservations"
  add_foreign_key "reservations", "locations"
  add_foreign_key "reservations", "users"
  add_foreign_key "types", "users"
end
