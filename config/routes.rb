Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update]
  
  resources :likes do
    collection do
      get 'search'
      get 'other_user/:id', to: 'likes#other_user'
    end
  end

  
  
  root 'likes#index'
end