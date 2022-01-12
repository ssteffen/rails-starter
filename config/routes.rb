Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :actors, only: [:index]

  # Defines the root path route ("/")
  root "actors#index"

  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
