Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :edit, :destroy, :show]
  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create, :show]
end
