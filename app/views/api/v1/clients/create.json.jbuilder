# frozen_string_literal: true

if @client.errors.present?
  json.errors @client.errors
else
  json.client do
    json.partial! '/api/v1/clients/client', client: @client
  end
end
