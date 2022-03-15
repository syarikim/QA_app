Rails.application.routes.draw do
  namespace :admin do
    get 'questions/index'
    get 'users/index'
    resources :users
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  root to: 'questions#index'

  get 'questions/unsolved'
  get 'questions/solved'
  resources :questions

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
