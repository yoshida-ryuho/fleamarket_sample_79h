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

  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'credits#show'
      post 'pay', to: 'credits#pay'
      post 'delete', to: 'credits#delete'

  resources :credits, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  
  resources :users
  resources :brands
  resources :comments
  resources :destinations
end
