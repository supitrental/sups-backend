# frozen_string_literal: true

return if @contact.nil?

json.errors @contact.errors if @contact.errors.present?
