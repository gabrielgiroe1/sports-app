Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }
  post 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  get 'users/:id' => 'users#show', as: :user

  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"

  # get "/users", to: "users#index"
  post "/filters", to: "filters#index"
  get "/posts", to: "posts#index"
  get "/posts/new", to: "posts#new"
  put "/users/:id", to: "users/registrations#update", as: "update_user_registration"
  resources :posts
  resources :users
end
