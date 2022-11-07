Rails.application.routes.draw do
  get '/users/current', to: 'users#current'
  get '/current_user', to: 'current_user#index'
  match '/users', to: 'users#index', via: 'get'
  match '/high_score', to: 'current_user#high_score', via: 'patch'
  match '/avatar', to: 'current_user#set_avatar', via: 'post'
  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
