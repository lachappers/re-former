Rails.application.routes.draw do
  get '/sign_in', to: 'sessions#new'
  get '/sign_out', to: 'sessions#destroy'
  resources :sessions, only: [:create]
  
  get '/register', to: 'users#new'

  resources :users
  # , only: [:create, :update, :show]



  # get 'sessions/new'
  # get 'sessions/create'
  # get 'sessions/destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#show"
  # get '/show', to: 'users#show'
  # get '/new', to: 'users#new'
  # get '/update', to: 'users#update'
  # get '/edit', to: 'users#edit'
end
