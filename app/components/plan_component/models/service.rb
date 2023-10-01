# frozen_string_literal: true

class Service < ApplicationRecord
  PER_SERVICE = 'PER_SERVICE'
  PER_DATA = 'PER_DATA'
  UNIT_TYPES = [PER_SERVICE, PER_DATA].freeze

  validates :key, presence: true, uniqueness: true
  validates :unit_type, inclusion: { in: UNIT_TYPES }, presence: true
  validates :description, presence: true
end
