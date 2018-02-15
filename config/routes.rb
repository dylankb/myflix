Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root to: 'pages#front'

  resources :videos, only: [:show] do
    collection do
      get :search, to: 'videos#search'
    end
  end

  get 'register', to: 'users#new'
  get 'sign_in', to: 'sessions#new'
  resources :users, only: [:create]

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
