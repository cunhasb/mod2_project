Rails.application.routes.draw do
  resources :users
  resources :sessions
  # delete after changing actions to new and create
  # resources :sessions creates those routes for us
  get '/log_in', to: 'sessions#log_in'
  post '/log_in', to: 'sessions#log_user_in'

  # move to likes_controller?
  post '/like', to: 'users#like'
  get '/likes', to: 'users#like'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sessions#log_in'
end
