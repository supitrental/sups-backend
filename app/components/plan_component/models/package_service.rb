# frozen_string_literal: true

class PackageService < ApplicationRecord
  belongs_to :package
  belongs_to :service

  after_save :update_price

  private

  def update_price
    update_columns(price: units * unit_price)
  end
end
