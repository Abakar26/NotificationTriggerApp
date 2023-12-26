require 'sidekiq/web'
Rails.application.routes.draw do
  root 'home#index'
  resources :registrations, only: %i[new create]
  mount Sidekiq::Web => '/sidekiq'
end
