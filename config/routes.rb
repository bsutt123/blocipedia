Rails.application.routes.draw do
  get 'welcome/home'

  root 'welcome#home'

  devise_for :users

  get 'wikis/private'
  put 'roles/update'

  resources :collaborators, only: [:edit, :create, :destroy]
  resources :charges, only: [:new, :create]
  resources :wikis
end
