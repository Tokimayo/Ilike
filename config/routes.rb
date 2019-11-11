Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update]
  
  resources :likes do
    collection do
      get 'search'
    end
  end

  resources :favorite_user, only: [:new, :create, :destroy] do
    collection do
      get 'search'
      get 'other_user/:id', to: 'favorite_user#other_user'
      get 'other_user_detail/:id', to: 'favorite_user#other_user_detail'
    end
  end

    root 'likes#index'
end