Rails.application.routes.draw do
  devise_for :users
  get 'profiles/index'
  root 'items#index'
 
  resources :items do
    collection do
      get 'confirm'
    end
  end
  resources :profiles
 
end
