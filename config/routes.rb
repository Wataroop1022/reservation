Rails.application.routes.draw do
  root to: 'home#top'
  get '/users/profile'
  patch '/users/profile', to: 'users#update_p'
  resources :users, only: [:new, :edit, :create]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/users/account'

  resources :rooms do
    collection {get 'search'}
    collection {get 'posts'}
  end
  resources :rooms, only: [:new, :create, :show]




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
