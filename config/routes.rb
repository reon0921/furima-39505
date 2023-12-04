Rails.application.routes.draw do
  get 'items/index'
  root to: "items#index"
  resources :items, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
