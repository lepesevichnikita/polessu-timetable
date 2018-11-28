require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  namespace :api, defaults: { format: :json } do
    # api/v1
    namespace :v1 do

      resources :groups, :teachers, only: %i[index show] do
        collection do
          get :search
        end
        resources :cards, only: %i[index], shallow: true do
        end
      end

    end
  end
end
