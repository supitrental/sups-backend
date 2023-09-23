# frozen_string_literal: true

namespace :api, defaults: { format: :json } do
  namespace :v1 do
    resources :clients, only: %i[create index update destroy show]
    resources :addresses, only: %i[create index update destroy show]
    resources :contacts, only: %i[create index update destroy show]
    resources :contracts, only: %i[create index update destroy show]
  end
end
