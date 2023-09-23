# frozen_string_literal: true

return if @contract.nil?

if @contract.errors.present?
  json.errors @contract.errors
else
  json.contract do
    json.partial! '/api/v1/contracts/contract', contract: @contract
  end
end
