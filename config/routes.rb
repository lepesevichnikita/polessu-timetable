require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  namespace :api, defaults: { format: :json } do
    # api/v1
    namespace :v1 do
      resources :teachers, only: %i[index show] do
        collection do
          get 'search?:query' => 'teachers#search'
        end
      end
    end

  end
end
