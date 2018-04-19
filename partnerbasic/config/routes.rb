Rails.application.routes.draw do
  get 'sessions/create'

  get 'sessions/destroy'

  get 'session/create'

  get 'session/destroy'

  resources :users
  resources :reviews
  resources :projects
  root 'welcome#index'

  resources :applications
  resources :groups
  resources :clubs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
