# frozen_string_literal: true

FactoryBot.define do
  factory :contract do
    client { nil }
    contact { nil }
    address { nil }
    billing_type { 'MyString' }
    billing_term { 'MyString' }
    tax_inclusive { 'MyString' }
    notes { 'MyString' }
  end
end
