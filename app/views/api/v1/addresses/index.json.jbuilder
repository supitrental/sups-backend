# frozen_string_literal: true

json.addresses @addresses do |address|
  json.partial! '/api/v1/addresses/address', address:
end
