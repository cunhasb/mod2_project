Rails.application.routes.draw do
  resources :users

  root "static#index"
  get '/log_in', to: 'users#log_in'
  post "/log_in", to: "users#log_user_in"
  get '/like', to: 'users#like'
  get '/sign_up', to: 'users#sign_up'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
