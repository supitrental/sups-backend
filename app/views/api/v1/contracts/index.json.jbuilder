# frozen_string_literal: true

json.contracts @contracts do |contract|
  json.partial! '/api/v1/contracts/contract', contract:
end
