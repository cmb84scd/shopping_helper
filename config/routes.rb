Rails.application.routes.draw do
  resources :users, except: :index
  root     'products#index'
  resources :products
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
