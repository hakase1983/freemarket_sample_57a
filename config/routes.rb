Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions:      'users/sessions' ,
    registrations: 'users/registrations',
    passwords:     'users/passwords'
  }

  root 'items#index'

  resources :users do
    collection do
      get "logout"
      get "profile"
    end
  end

  resources :personal_infos

  resources :cards do
    collection do
      get "payment"
      get "add"
    end
  end
  
  resources :items do
    collection do
      get "confirmation" 
      get "complete"
      get 'get_image', defaults: { format: 'json' }
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  end
  
  resources :signup do
    collection do
      get 'type'
      get 'sms' 
      get 'completed' 
    end
  end 

end
