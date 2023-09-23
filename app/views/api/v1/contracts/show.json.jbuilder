# frozen_string_literal: true

return if @contract.nil?

json.contract do |json|
  json.partial! '/api/v1/contracts/contract', contract: @contract
end
