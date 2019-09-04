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
    end
  end
  
  resources :signup do
    collection do
      get 'step1'
      get 'step3'
      get 'signup-type'
      get 'signup-sms' 
      get 'signup-completed' 
    end
  end 
end
