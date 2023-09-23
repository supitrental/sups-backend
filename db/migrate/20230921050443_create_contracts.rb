# frozen_string_literal: true

class CreateContracts < ActiveRecord::Migration[7.0]
  def change
    create_table :contracts do |t|
      t.references :client, null: false, foreign_key: true
      t.references :contact, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true
      t.string :billing_type, default: 'PREPAID'
      t.integer :billing_term, default: 7
      t.boolean :tax_inclusive, default: false
      t.string :notes

      t.timestamps
    end
  end
end
