Rails.application.routes.draw do
  # root to: 'sessions#new'
  resources :users, except: [:index, :show, :edit]
  get '/profile', to: 'users#show', as: 'profile'
  get '/profile/edit', to: 'users#edit', as: 'edit_profile'
  # get '/signup', to: 'users#new', as: 'signup'
  resources :sessions, only: [:new, :create, :destroy]
  delete '/logout', to: 'sessions#destroy', as: 'logout'
end
