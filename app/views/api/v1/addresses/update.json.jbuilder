# frozen_string_literal: true

return if @address.nil?

if @address.errors.present?
  json.errors @address.errors
else
  json.address do
    json.partial! '/api/v1/addresses/address', address: @address
  end
end
