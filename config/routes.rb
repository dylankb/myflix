Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root to: redirect('/home')
  get '/home', to: 'videos#index', as: 'home'

  resources :videos, only: [:show] do
    collection do
      get :search, to: "videos#search"
    end
  end

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
