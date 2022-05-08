Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
  namespace :admin do
    get 'questions/index'
    get 'users/index'
    resources :users, only: %i[index destroy]
    resources :questions, only: %i[index destroy]
  end
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :users
  root to: 'questions#index'
  get 'questions/unsolved'
  get 'questions/solved'
  resources :questions
  resources :questions do
    resources :answers, only: %i[create destroy]
    resource  :solve, only: [:create], to: 'questions#solve'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end