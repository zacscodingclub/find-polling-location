Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: [:create, :index, :data]
  get '/results', to: 'users#results'
end
