Rails.application.routes.draw do
  root 'welcome#index'

  resources :applications
  resources :reviews
  resources :projects
  resources :groups
  resources :companies
  resources :clubs
  resources :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
