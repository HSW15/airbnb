Rails.application.routes.draw do
  get 'user/index'

  resources :users

  root 'user#index'
end
