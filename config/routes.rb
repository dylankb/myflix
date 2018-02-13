Myflix::Application.routes.draw do
  get 'ui(/:action)', controller: 'ui'

  get '/', to: 'videos#index'
end
