Rails.application.routes.draw do
  get 'persons/profile'
  devise_for :users
  root 'posts#index'
  resources :posts
end
