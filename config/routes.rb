Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: [:create, :index]
  get '/results', to: 'users#results'
  get '/data', to: 'users#data'
end
