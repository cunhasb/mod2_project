Rails.application.routes.draw do
  resources :users

  get '/log_in', to: 'users#log_in'
  post "/log_in", to: "users#log_user_in"

  get '/like', to: 'users#like'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
