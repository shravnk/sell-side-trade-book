Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/transacts/new', to: 'transacts#new'
  # get '/transacts/:id', to: 'transacts#show', as: 'transact'
  # get '/transacts', to: 'transacts#index'
  # post '/transacts', to: 'transacts#create'

  resources :transacts
  resources :traders
  resources :salespeople
  resources :clients
  resources :users

  get '/home', to: 'users#home', as: 'home'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions/', to: 'sessions#destroy'
  root 'users#home'
  resources :traders, only: [:show] do 
  	resources :transacts, only: [:show, :index] 
  end

  resources :clients, only: [:show] do 
    resources :transacts, only: [:show, :index] 
  end

  resources :salespeople, only: [:show] do 
    resources :transacts, only: [:show, :index] 
  end
end
