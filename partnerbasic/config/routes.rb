Rails.application.routes.draw do
  root 'welcome#index'

  get 'sessions/destroy'

  get 'session/create'

  get 'sessions/new'

  resources :users
  resources :reviews
  resources :projects

  resources :applications
  resources :groups
  resources :clubs do
    member do
      post 'add_club_member'
    end
  end

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
