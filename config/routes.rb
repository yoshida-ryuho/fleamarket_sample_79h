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
      get 'category/get_category_children', to: 'items#get_category_children', defaults: { format: 'json' }
      get 'category/get_category_grandchildren', to: 'items#get_category_grandchildren', defaults: { format: 'json' }
    end
  end

  resources :credits,only:[:index,:new,:show,:edit,:update]do
    collection do
      #payjpでトークン化を行う
      post 'pay', to: 'credits#pay'
      #カード削除
      post 'delete', to: 'credits#delete'
      #カード情報入力
      post 'show', to: 'credits#show'
    end
  end
    
  resources :users do
    collection do
      post 'buy',to: 'users#buy'
      get  'done_buy',to: 'users#done_buy'
    end
    member do
      get 'confirm'
    end
  end
  resources :brands
  resources :comments
  resources :destinations
  resources :categories, only: [:index, :show]
end