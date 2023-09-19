# frozen_string_literal: true

if @address.errors.present?
  json.errors @address.errors
else
  json.address do
    json.partial! '/api/v1/addresses/address', address: @address
  end
end
