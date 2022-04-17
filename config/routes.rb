Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
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
  # post 'questions/:id/answers', to: 'answers#create', as: :answer
  resources :questions do
    resources :answers, only: [:create, :destroy]
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end