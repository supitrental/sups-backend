# frozen_string_literal: true

class CreatePackages < ActiveRecord::Migration[7.0]
  def change
    create_table :packages do |t|
      t.string :package_type, default: 'MAIN'
      t.string :description, null: false
      t.decimal :price, default: 0.0

      t.timestamps
    end
  end
end
