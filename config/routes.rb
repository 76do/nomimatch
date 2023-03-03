Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, shallow: true, param: :random_id do
        resources :requests, only: [:create]
        member do
          get 'name'
        end
      end
      
      resource :user do
        get 'requests' => 'requests#index'
      end

      get 'current_user' => 'authentications#current_user_info'
      post 'chats' => 'chats#index'
      resource :registration, only: [:create]
      resource :authentication, only: [:create, :destroy]

      if Rails.env.development?
        mount LetterOpenerWeb::Engine, at: "/letter_opener"
      end
    end
  end
end
