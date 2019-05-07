# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190503225159) do

  create_table "comments", id: :binary, limit: 16, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "content"
    t.integer "rating", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "doctor_medical_units", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.binary "doctor_id", limit: 16, null: false
    t.binary "medical_unit_id", limit: 16, null: false
    t.index ["doctor_id"], name: "doctors__fk"
    t.index ["medical_unit_id"], name: "medical_units__fk"
  end

  create_table "doctors", id: :binary, limit: 16, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nume", limit: 25, null: false
    t.integer "an_absolvire", null: false
    t.string "specializare", limit: 30, null: false
    t.binary "poza_profil"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "medical_units", id: :binary, limit: 16, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nume", limit: 25, null: false
    t.string "locatie", null: false
    t.string "tip_unitate", limit: 30, null: false
    t.binary "sigla"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "migrations", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "migration", null: false
    t.integer "batch", null: false
  end

  create_table "oauth_access_tokens", id: :string, limit: 100, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "user_id"
    t.integer "client_id", null: false
    t.string "name"
    t.text "scopes"
    t.boolean "revoked", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.datetime "expires_at"
    t.index ["user_id"], name: "oauth_access_tokens_user_id_index"
  end

  create_table "oauth_auth_codes", id: :string, limit: 100, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "user_id", null: false
    t.integer "client_id", null: false
    t.text "scopes"
    t.boolean "revoked", null: false
    t.datetime "expires_at"
  end

  create_table "oauth_clients", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "user_id"
    t.string "name", null: false
    t.string "secret", limit: 100, null: false
    t.text "redirect", null: false
    t.boolean "personal_access_client", null: false
    t.boolean "password_client", null: false
    t.boolean "revoked", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["user_id"], name: "oauth_clients_user_id_index"
  end

  create_table "oauth_personal_access_clients", id: :integer, unsigned: true, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.integer "client_id", null: false
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.index ["client_id"], name: "oauth_personal_access_clients_client_id_index"
  end

  create_table "oauth_refresh_tokens", id: :string, limit: 100, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "access_token_id", limit: 100, null: false
    t.boolean "revoked", null: false
    t.datetime "expires_at"
    t.index ["access_token_id"], name: "oauth_refresh_tokens_access_token_id_index"
  end

  create_table "password_resets", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "email", null: false
    t.string "token", null: false
    t.timestamp "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["email"], name: "password_resets_email_index"
    t.index ["token"], name: "password_resets_token_index"
  end

  create_table "user_details", id: :integer, default: nil, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "nume", limit: 25
    t.string "afectiune", limit: 25
    t.binary "imag_profil"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci" do |t|
    t.string "email", null: false
    t.string "password", null: false
    t.string "remember_token", limit: 100
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string "role", limit: 25, null: false
    t.index ["email"], name: "users_email_unique", unique: true
  end

  add_foreign_key "comments", "doctors", column: "id", name: "comments_doctors_id_fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "doctor_medical_units", "doctors", name: "doctors__fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "doctor_medical_units", "medical_units", name: "medical_units__fk", on_update: :cascade, on_delete: :cascade
  add_foreign_key "user_details", "users", column: "id", name: "user_details_users_id_fk", on_update: :cascade, on_delete: :cascade
end
