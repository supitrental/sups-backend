# frozen_string_literal: true

return if @address.nil?

json.address do
  json.partial! '/api/v1/addresses/address', address: @address
end
