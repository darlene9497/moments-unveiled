Rails.application.routes.draw do
  # Root route
  root 'home#index'

  # Users
  resources :users, only: [:index, :show, :create, :update, :destroy]

  # Posts
  resources :posts, only: [:index, :show, :create, :update, :destroy] do
    # Nested Comments
    resources :comments, only: [:index, :create]
  end

  # Comments
  resources :comments, only: [:index, :show, :update, :destroy]

  # Likes
  resources :likes, only: [:create, :destroy]
end