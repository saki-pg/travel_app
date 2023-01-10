Rails.application.routes.draw do
  get 'users/index'
  get 'posts/index'
  root 'users#index'

  get 'posts/index', to:'users#index'
  get 'posts/list', to:'posts#list'
  get 'posts/search', to:'posts#search'
  get 'users/profile', to:'users#profile'

  get '/login', to:'users#login_form'
  post '/login', to:'users#login'
  post '/logout', to:'users#logout'



   resources :users
   resources :posts
   resources :reservations
end

