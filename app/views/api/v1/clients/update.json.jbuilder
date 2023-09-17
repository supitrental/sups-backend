# frozen_string_literal: true

return if @client.nil?

if @client.errors.present?
  json.errors @client.errors
else
  json.client do
    json.partial! '/api/v1/clients/client', client: @client
  end
end
