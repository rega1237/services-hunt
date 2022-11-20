Rails.application.routes.draw do
  resources :categories
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :services do
    get 'search', on: :collection
  end
end
