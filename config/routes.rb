Rails.application.routes.draw do
  devise_for :users
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
  resources :destinations
  resources :images
end