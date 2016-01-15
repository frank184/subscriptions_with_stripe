Rails.application.routes.draw do
  root 'episodes#index'

  devise_for :users

  resources :users
  resources :episodes
  resource :subscription
  resource :card
end
