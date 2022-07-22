Rails.application.routes.draw do

  get 'users/show'
  get 'users/:user_id' => 'users#show', as: :user
  get 'users/:user_id/posts' => 'posts/index', as: :user_posts
  get 'users/:user_id/posts/:post_id' => 'posts#show', as: :user_posts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "home#index"
end
