Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get  'destinations', to: 'users/registrations#new_destination'
    post 'destinations', to: 'users/registrations#create_destination'
  end
  root 'items#index'
 
  resources :items do
    collection do
      get 'confirm'
    end
  end

  resources :categories do 
    collection do
      get '/get_category_children', to: 'categories#get_category_children', defaults: { format: 'json' }
      get '/get_category_grandchildren', to: 'categories#get_category_grandchildren', defaults: { format: 'json' }
    end
  end
    
    resources :users
    resources :brands
    resources :comments
    resources :credits
    resources :destinations
    resources :categories, only: [:index, :show]
end