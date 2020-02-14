Rails.application.routes.draw do
  root  'home#index'
  resources :users, only: [:create, :new]
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  mount ActionCable.server, at: '/cable'
end
