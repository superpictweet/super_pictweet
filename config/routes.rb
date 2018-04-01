Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "tweets#index"
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
  resources :follows, only: :create

  namespace :api do
    namespace :v1 do
      resources :tweets, only: %i[index show create update]
    end
  end
end
