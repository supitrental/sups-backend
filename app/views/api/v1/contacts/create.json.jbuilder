# frozen_string_literal: true

if @contact.errors.present?
  json.errors @contact.errors
else
  json.contact do
    json.partial! '/api/v1/contacts/contact', contact: @contact
  end
end
