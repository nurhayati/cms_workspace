Rails.application.routes.draw do
  devise_for :users
  root 'home#show'
  resources :posts do
    resources :comments
  end

  resources :categories
end
