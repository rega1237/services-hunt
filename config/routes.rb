Rails.application.routes.draw do
  resources :comments
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  # Defines the root path route ("/")
  # root "articles#index"
  resources :services do
    get 'search', on: :collection
  end

  resources :categories, only: [:show, :new, :create, :edit, :update, :destroy]
end
