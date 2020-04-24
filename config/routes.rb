Rails.application.routes.draw do
  devise_for :users
  get 'articles/index'
  root controller: :articles, action: :index
  resources :articles
end
