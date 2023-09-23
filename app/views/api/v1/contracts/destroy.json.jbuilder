# frozen_string_literal: true

return if @contract.nil?

json.errors @contract.errors if @contract.errors.present?
