# frozen_string_literal: true

class CreateContacts < ActiveRecord::Migration[7.0]
  def change
    create_table :contacts do |t|
      t.references :client, null: false, foreign_key: true
      t.string :full_name, null: false
      t.string :email
      t.string :phone_number
      t.boolean :primary, default: false

      t.timestamps
    end
  end
end
