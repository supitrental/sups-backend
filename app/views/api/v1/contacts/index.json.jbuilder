# frozen_string_literal: true

json.contacts @contacts do |contact|
  json.partial! '/api/v1/contacts/contact', contact:
end
