# frozen_string_literal: true

class Contract < ApplicationRecord
  BILLING_PREPAID = 'PREPAID'
  BILLING_POSTPAID = 'POSTPAID'
  BILLING_TYPES = [Contract::BILLING_PREPAID, Contract::BILLING_POSTPAID].freeze

  belongs_to :client
  belongs_to :contact
  belongs_to :address

  validates :billing_type, inclusion: { in: BILLING_TYPES }, presence: true
  validates :billing_term, presence: true
end
