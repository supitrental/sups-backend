# frozen_string_literal: true

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

ActiveRecord::Schema[7.0].define(version: 20_230_921_050_443) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'addresses', force: :cascade do |t|
    t.bigint 'client_id', null: false
    t.string 'postal_code', null: false
    t.string 'city', null: false
    t.string 'full_address', null: false
    t.boolean 'primary', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['client_id'], name: 'index_addresses_on_client_id'
  end

  create_table 'clients', force: :cascade do |t|
    t.string 'name', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'contacts', force: :cascade do |t|
    t.bigint 'client_id', null: false
    t.string 'full_name', null: false
    t.string 'email'
    t.string 'phone_number'
    t.boolean 'primary', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['client_id'], name: 'index_contacts_on_client_id'
  end

  create_table 'contracts', force: :cascade do |t|
    t.bigint 'client_id', null: false
    t.bigint 'contact_id', null: false
    t.bigint 'address_id', null: false
    t.string 'billing_type', default: 'PREPAID'
    t.integer 'billing_term', default: 7
    t.boolean 'tax_inclusive', default: false
    t.string 'notes'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['address_id'], name: 'index_contracts_on_address_id'
    t.index ['client_id'], name: 'index_contracts_on_client_id'
    t.index ['contact_id'], name: 'index_contracts_on_contact_id'
  end

  create_table 'jwt_deny_lists', force: :cascade do |t|
    t.string 'jti'
    t.datetime 'exp'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['jti'], name: 'index_jwt_deny_lists_on_jti', unique: true
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  add_foreign_key 'addresses', 'clients'
  add_foreign_key 'contacts', 'clients'
  add_foreign_key 'contracts', 'addresses'
  add_foreign_key 'contracts', 'clients'
  add_foreign_key 'contracts', 'contacts'
end
