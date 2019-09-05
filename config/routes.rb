Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users
  resources :cards do
    collection do
      get "add"
    end
  end
  resources :items do
    collection do
      get "confirmation" 
      get 'get_image', defaults: { format: 'json' }
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
end
