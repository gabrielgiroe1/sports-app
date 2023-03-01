Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      root "home#index"

      # resources :users do
      #   post "users", to: 'users#create'
      #   post 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
      #   get 'users/:id' => 'users#show', as: :user
      #   put "/users/:id", to: "registrations#update", as: "update_user_registration"
      #  devise_for :users, :controllers=> {registration: 'users/registration', session: 'users/session '}
      # end

      devise_for :users, path: '', path_names: {
        sign_in: 'login',
        sign_out: 'logout',
        registration: 'signup'
      },
                 controllers: {
                   sessions: 'api/v1/users/sessions',
                   registrations: 'api/v1/users/registrations'
                 }

      # get '/current_user', to: 'api/v1/current_user#index'


      resources :posts do
        get "/posts", to: "posts#index"
        get "/posts/new", to: "posts#new"
        get 'filter_by_dates', to: 'posts#index', as: 'filter_by_dates'
        get 'average_speed', to: 'posts#average_speed', as: 'average_speed'
      end

      resources :reports do
        get 'weekly_averages', to: 'reports#weekly_averages', as: 'weekly_averages'
      end
    end
  end



  devise_for :users,
             path: 'api/v1/users',
             controllers: {
               sessions: 'api/v1/users/sessions',
               registrations: 'api/v1/users/registrations'
             }
end
