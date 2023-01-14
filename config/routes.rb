Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :requests
      end
      resource :registration, only: [:create]
    end
  end
end
