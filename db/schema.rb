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

ActiveRecord::Schema.define(version: 2019_09_28_205250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.bigint "type_id"
    t.bigint "nombre_adulte"
    t.bigint "nombre_enfant"
    t.bigint "nombre_salon"
    t.bigint "nombre_chamber"
    t.bigint "nombre_toillete"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["type_id"], name: "index_locations_on_type_id"
    t.index ["user_id"], name: "index_locations_on_user_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "libelle"
    t.boolean "etat"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_types_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
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
  add_foreign_key "types", "users"
end
