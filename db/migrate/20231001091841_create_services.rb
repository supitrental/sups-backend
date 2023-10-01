# frozen_string_literal: true

class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.string :description, null: false
      t.decimal :unit_price, default: 0.0
      t.string :unit_type, default: 'PER_SERVICE'
      t.string :key, null: false

      t.timestamps
    end
  end
end
