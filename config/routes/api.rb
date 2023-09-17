# frozen_string_literal: true

namespace :api, defaults: { format: :json } do
  namespace :v1 do
    resources :clients, only: %i[create index update destroy show]
  end
end
