Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root "tweets#index"
  resources :tweets do
    resources :likes, only: [:create, :destroy]
  end
  resources :users, only: :show
  resources :follows, only: :create
  resources :acts_as_taggable_on_tags, only [:index, :show]
end
