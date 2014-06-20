Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations:       "users/registrations"
  }
  root 'home#show'
  resources :posts do
    resources :comments
    member do
      post  :like
    end
  end

  resources :categories
  resources :likes
end
