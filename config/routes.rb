Rails.application.routes.draw do
  get 'users/index'
  get 'posts/index'

  get 'posts/index',to:'users#index'
  get 'posts/list',to:'posts#list'
  get 'posts/search',to:'posts#search'
  get 'users/profile',to:'users#profile'


  root 'users#index'

   resources :users
   resource :post
   resource :reservation
end

