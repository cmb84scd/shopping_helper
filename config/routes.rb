Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  
  root     'products#index'
  resources :users, except: :index
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
