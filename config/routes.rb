Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  resources :home, only: [:index]
  get 'signup' => 'users#new'
  resources :users, only: [:new, :create, :index, :show]
  resource :profile, only: [:new, :create, :show]
  resolve("Profile") { [:profile] }
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'logout'  => 'sessions#destroy'
  resources :sessions, only: [:new, :create] 
end
