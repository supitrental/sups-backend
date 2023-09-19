# frozen_string_literal: true

class Address < ApplicationRecord
  include Concerns::HasPrimaryRecord

  belongs_to :client

  validates :postal_code, presence: true
  validates :city, presence: true
  validates :full_address, presence: true
end
