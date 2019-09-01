Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items 
  resources :users
  get 'cards/add'  => 'cards#add'
  resources :cards 
end
