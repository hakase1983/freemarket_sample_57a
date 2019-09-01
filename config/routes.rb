Rails.application.routes.draw do
  root 'items#index'
  resources :users
  resources :items do
    collection do
      get "confirmation" 
    end
  end
end
