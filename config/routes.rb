Rails.application.routes.draw do
  get 'users/show'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "tweets#index"
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
  resources :follows, only: :create
end
