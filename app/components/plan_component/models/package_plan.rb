# frozen_string_literal: true

class PackagePlan < ApplicationRecord
  BILLING_ONE_TIME = 'ONE_TIME'
  BILLING_WEEKLY = 'WEEKLY'
  BILLING_MONTHLY = 'MONTHLY'
  BILLING_YEARLY = 'YEARLY'
  BILLING_INTERVALS = [BILLING_ONE_TIME, BILLING_WEEKLY, BILLING_MONTHLY, BILLING_YEARLY].freeze

  DISCOUNT_PERCENTAGE = 'PERCENTAGE'
  DISCOUNT_FIXED = 'FIXED'
  DISCOUNT_TYPES = [DISCOUNT_PERCENTAGE, DISCOUNT_FIXED].freeze

  belongs_to :package

  validates :description, presence: true
  validates :billing_interval, inclusion: { in: BILLING_INTERVALS }
  validates :discount_type, inclusion: { in: DISCOUNT_TYPES }

  after_commit :update_price, on: %i[create update]

  def gross_price
    rate * bill_every
  end

  def discount_amount
    return discount_value if fixed_discount?

    # percentage
    gross_price * discount_value / 100
  end

  def fixed_discount?
    discount_type == DISCOUNT_FIXED
  end

  private

  def update_price
    update_columns(price: gross_price - discount_amount)
  end
end
