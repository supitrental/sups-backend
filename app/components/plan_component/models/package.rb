# frozen_string_literal: true

class Package < ApplicationRecord
  TYPE_MAIN = 'MAIN'
  TYPE_ADDON = 'ADDON'
  PACKAGE_TYPES = [TYPE_MAIN, TYPE_ADDON].freeze

  has_many :package_plans
  has_many :package_services

  alias_attribute :plans, :package_plans
  alias_attribute :services, :package_services

  accepts_nested_attributes_for :package_plans, :package_services

  validates :package_type, inclusion: { in: PACKAGE_TYPES }
  validates :description, presence: true

  after_commit :update_price, on: %i[create update]

  private

  def update_price
    total_service_price = services.reduce(0) { |sum, service| sum + service.price }
    update_columns(price: total_service_price)
  end
end
