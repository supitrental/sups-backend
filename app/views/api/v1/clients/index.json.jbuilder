# frozen_string_literal: true

json.clients @clients do |client|
  json.partial! '/api/v1/clients/client', client:
end
