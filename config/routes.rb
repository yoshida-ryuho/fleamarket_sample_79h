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
  resources :profiles
  resources :brands
  resources :comments
  resources :credits
  # resources :destinations
  resources :images
end