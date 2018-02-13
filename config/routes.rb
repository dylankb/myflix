Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  root to: redirect('/home')
  get '/home', to: 'videos#index', as: 'home'
end
