Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'shares#index'
  post '/auth/spotify/callback', to: 'users#spotify'

  resources :shares, shallow:true do
    resources :likes, only: [:create,:destroy,:update]
  end

  resources :users, only: [:new,:create,:destroy]
  resources :sessions, only: [:new,:create] do
    delete :destroy, on: :collection
  end
  resources :search_caches, only:[:create]

end
