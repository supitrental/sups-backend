# frozen_string_literal: true

return if @client.nil?

json.client do
  json.partial! '/api/v1/clients/client', client: @client
end
