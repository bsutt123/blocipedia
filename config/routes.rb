Rails.application.routes.draw do
  get 'welcome/home'

  root 'welcome#home'

  devise_for :users

  get 'wikis/private'
  put 'roles/update'

  resources :collaborators, only: [:edit,]
  resources :charges, only: [:new, :create]
  resources :wikis

  post 'collaborators/create'
  delete 'collaborators/destroy'
end
