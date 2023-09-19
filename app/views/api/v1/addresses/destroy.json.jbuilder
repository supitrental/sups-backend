# frozen_string_literal: true

return if @address.nil?

json.errors @address.errors if @address.errors.present?
