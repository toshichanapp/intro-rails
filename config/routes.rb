Rails.application.routes.draw do
  root to: 'tweets#index'
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
end
