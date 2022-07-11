Rails.application.routes.draw do
  get 'users/:user_id', to: 'users#show'
  get 'users', to: 'users#index'

  get 'users/:user_id/posts/index', to: 'posts#index'
  get 'users/:user_id/posts/:post_id', to: 'posts#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
