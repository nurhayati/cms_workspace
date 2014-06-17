Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations:       "users/registrations"
  }
  root 'home#show'
  resources :posts do
    resources :comments
  end

  resources :categories
end
