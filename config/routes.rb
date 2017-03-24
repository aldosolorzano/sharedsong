Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'shares#index'
  post '/auth/spotify/callback', to: 'users#spotify'
  resources :shares
  resources :users, only: [:new,:create,:destroy]
  resources :sessions, only: [:new,:create] do
    delete :destroy, on: :collection
  end

end
