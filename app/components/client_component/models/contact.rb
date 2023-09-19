# frozen_string_literal: true

class Contact < ApplicationRecord
  include Concerns::HasPrimaryRecord
  belongs_to :client

  validates :full_name, presence: true
end
