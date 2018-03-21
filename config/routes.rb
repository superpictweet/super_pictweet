Rails.application.routes.draw do
  get 'users/show'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "tweets#index"
  resources :tweets
  resources :users, only: :show
  resources :follows, only: :create
end
