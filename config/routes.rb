Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :create, :new, :show]  do
      resources :comments, only: [:create, :index]
      resources :likes, only: [:create, :destroy]
    end
  end

  root to: "home#index"
end
