# frozen_string_literal: true

class CreatePackagePlans < ActiveRecord::Migration[7.0]
  def change
    create_table :package_plans do |t|
      t.references :package, null: false, foreign_key: true
      t.string :description, null: false
      t.string :billing_interval, default: 'MONTHLY'
      t.integer :bill_every, default: 1
      t.decimal :discount_value, default: 0.0
      t.string :discount_type, default: 0.0
      t.decimal :rate, default: 0.0
      t.decimal :price, default: 0.0

      t.timestamps
    end
  end
end
