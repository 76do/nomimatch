Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, shallow: true, param: :random_id do
        resources :requests
        member do
          get 'name'
        end
      end

      resource :registration, only: [:create]
      resource :authentication, only: [:create]
    end
  end
end
