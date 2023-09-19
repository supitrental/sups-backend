# frozen_string_literal: true

class Address < ApplicationRecord
  belongs_to :client

  before_save :default_primary_address
  after_save :update_primary_address
  before_destroy :prevent_destroying_primary_address, prepend: true

  validates :postal_code, presence: true
  validates :city, presence: true
  validates :full_address, presence: true

  scope :primary, -> { where(primary: true) }

  def prevent_destroying_primary_address
    return unless primary?

    errors.add(:base, 'cannot delete primary address')
    throw :abort
  end

  def update_primary_address
    return unless primary?

    Address.where.not(id:).update_all(primary: false)
  end

  def default_primary_address
    self.primary = true if Address.primary.count.zero?
  end
end
