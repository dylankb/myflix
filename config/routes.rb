Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root to: 'pages#front'
  get '/home', to: 'videos#index'

  resources :videos, only: [:show] do
    collection do
      get :search, to: 'videos#search'
    end
    resources :reviews, only: [:create]
  end

  get 'register', to: 'users#new'
  resources :users, only: [:create]

  get 'sign_in', to: 'sessions#new'
  get 'sign_out', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  # These also work

  # resources :videos, only: [:show] do
  #   collection do
  #     get :search
  #   end
  # end

  # resources :videos, only: [:show] do
  #   get :search, on: :collection
  # end
end
