# frozen_string_literal: true

return if @contact.nil?

json.contact do |json|
  json.partial! '/api/v1/contacts/contact', contact: @contact
end
