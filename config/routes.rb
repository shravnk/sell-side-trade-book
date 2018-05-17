Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # get '/transacts/new', to: 'transacts#new'
  # get '/transacts/:id', to: 'transacts#show', as: 'transact'
  # get '/transacts', to: 'transacts#index'
  # post '/transacts', to: 'transacts#create'

  resources :transacts
  resources :traders, only: [:show, :index]
  resources :salespeople, only: [:show, :index]
  resources :clients, only: [:show, :index]
  resources :bonds, only: [:show, :index]
  resources :users, only: [:new, :create, :update]

  get '/home', to: 'users#home', as: 'home'
  get 'signup', to: 'users#new'

  get '/auth/github/callback' => 'sessions#create'

  get '/users/new_fb', to: 'users#new_fb'

  patch '/transacts/:id/confirm', to: 'transacts#confirm', as: 'confirm_transact'
  get '/pending_transacts', to: 'transacts#pending'

  get '/signin', to: 'sessions#new', as: 'signin'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions/', to: 'sessions#destroy'
  
  root 'users#home'

  resources :traders, only: [:show] do 
  	resources :transacts, only: [:show, :index]
    get '/pending_transacts', to: 'transacts#pending' 
  end

  resources :clients, only: [:show] do 
    resources :transacts, only: [:show, :index, :new, :create] 
  end

  resources :bonds, only: [:show] do 
    resources :transacts, only: [:show, :index, :new, :create]
  end

  resources :salespeople, only: [:show] do 
    resources :transacts, only: [:show, :index]
    get '/pending_transacts', to: 'transacts#pending' 
  end
end
