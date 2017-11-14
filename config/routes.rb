Rails.application.routes.draw do
  resources :params
  resources :users
  resources :sessions
  # delete after changing actions to new and create
  # resources :sessions creates those routes for us
  get '/log_in', to: 'sessions#log_in'
  post '/log_in', to: 'sessions#log_user_in'

  root "static#index"
  get '/log_in', to: 'users#log_in'
  post "/log_in", to: "users#log_user_in"
  get '/like', to: 'users#like'
  get '/sign_up', to: 'users#sign_up'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sessions#log_in'
end
