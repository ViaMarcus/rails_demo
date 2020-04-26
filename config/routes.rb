Rails.application.routes.draw do
  devise_for :users
  get 'users/:username', to: 'articles#user'
  get 'articles/index'
  root controller: :articles, action: :index
  resources :articles
end
