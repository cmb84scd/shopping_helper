Rails.application.routes.draw do
  root     'sessions#new'

  resources :users, except: :index
  resources :products
  resources :items, except: :show
  get 'sessions/new',     to: 'sessions#new'
  post 'sessions',        to: 'sessions#create'
  get 'sessions/destroy', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
