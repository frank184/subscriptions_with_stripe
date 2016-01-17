Rails.application.routes.draw do
  mount StripeEvent::Engine, at: '/stripe/webhook'
  root 'episodes#index'

  devise_for :users

  resources :users
  resources :episodes
  resources :charges

  resource :subscription
  resource :card
end
