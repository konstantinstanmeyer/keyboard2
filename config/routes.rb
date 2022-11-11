Rails.application.routes.draw do
  resources :score, only: [:create, :index, :show]
  get '/users/current', to: 'users#current'
  get '/current_user', to: 'current_user#index'
  post '/scores/save', to: 'current_user#save_score'
  get '/users/scores/:id', to: 'current_user#show_scores'
  match '/users', to: 'users#index', via: 'get'
  get 'scores/user/:id', to: 'score#user_scores'
  match '/avatar', to: 'current_user#set_avatar', via: 'post'
  get '/words/:count', to: 'score#get_words'
  patch '/current_user/update', to: 'current_user#update_user'
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
