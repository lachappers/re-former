Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users
  # Defines the root path route ("/")
  # root "articles#index"
  # root "users#show"
  # get '/show', to: 'users#show'
  # get '/new', to: 'users#new'
  # get '/update', to: 'users#update'
  # get '/edit', to: 'users#edit'
end
