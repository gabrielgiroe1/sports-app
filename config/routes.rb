Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      root "home#index"
      post 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
      get 'users/:id' => 'users#show', as: :user
      get "/posts", to: "posts#index"
      get "/posts/new", to: "posts#new"
      get 'filter_by_dates', to: 'posts#index', as: 'filter_by_dates'
      get 'average_speed', to: 'posts#average_speed', as: 'average_speed'

      devise_for :users, :controllers => { registrations: 'users/registrations', sessions: 'users/sessions' }


      get 'weekly_averages', to: 'reports#weekly_averages', as: 'weekly_averages'
      resources :users
      resources :posts
    end
  end
  put "/users/:id", to: "users/registrations#update", as: "update_user_registration"
end
