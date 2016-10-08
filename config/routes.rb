Rails.application.routes.draw do
  root to: 'pages#index'

  resources :users, only: [:create]
  get '/results', to: 'users#results'
end
