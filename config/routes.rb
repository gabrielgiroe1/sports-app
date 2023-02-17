Rails.application.routes.draw do
  devise_for :users
  post 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
  get 'users/:id' => 'users#show', as: :user
  # get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
   root "home#index"

  # get "/users", to: "users#index"
  get "/posts", to: "posts#index"
  get "/posts/new", to: "posts#new"
  resources :posts
  resources :users
end
