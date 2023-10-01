# frozen_string_literal: true

class CreatePackageServices < ActiveRecord::Migration[7.0]
  def change
    create_table :package_services do |t|
      t.references :package, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.decimal :units, default: 1
      t.decimal :unit_price, default: 0.0
      t.decimal :price, default: 0.0

      t.timestamps
    end
  end
end
