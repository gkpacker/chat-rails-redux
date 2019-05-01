Rails.application.routes.draw do
  root to: 'channels#show'

  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :channels, only: [] do
        resources :messages, only: [ :index, :create ]
      end
    end
  end

  resources :channels, only: [ :show ]
end
