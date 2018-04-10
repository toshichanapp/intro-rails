Rails.application.routes.draw do
  root to: 'blogs#index'
  resources :users
  resources :sessions, only: %i[new create destroy]
  resources :contacts
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :tweets do
    collection do
      post :confirm
    end
  end
  resources :favorites, only: [:index, :create, :destroy]
end
