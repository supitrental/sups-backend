# frozen_string_literal: true

module Concerns
  module HasPrimaryRecord
    extend ActiveSupport::Concern

    included do
      before_save :set_default_primary_record
      after_save :update_primary_record_uniqueness
      before_destroy :prevent_destorying_primary_record, prepend: true

      scope :primary, -> { where(primary: true) }
    end

    def prevent_destorying_primary_record
      return unless primary?

      errors.add(:base, 'cannot delete primary data')
      throw :abort
    end

    def update_primary_record_uniqueness
      return unless primary?

      self.class.where.not(id:).update_all(primary: false)
    end

    def set_default_primary_record
      self.primary = true if self.class.primary.count.zero?
    end
  end
end
