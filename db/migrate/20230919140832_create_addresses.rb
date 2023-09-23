# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :client, null: false, foreign_key: true
      t.string :postal_code, null: false
      t.string :city, null: false
      t.string :full_address, null: false
      t.boolean :primary, default: false

      t.timestamps
    end
  end
end
