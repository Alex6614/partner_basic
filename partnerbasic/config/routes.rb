Rails.application.routes.draw do
  root 'welcome#index'

  get 'sessions/destroy'

  get 'session/create'

  get 'sessions/new'

  resources :users
  resources :reviews
  resources :projects

  resources :applications
  resources :clubs do
    resources :groups do
      member do
        post 'add_group_member'
        post 'remove_group_member'
      end
    end
    member do
      post 'add_club_member'
      post 'remove_club_member'
      post 'create_group'
    end
  end

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
