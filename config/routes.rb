Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "post#index"

  # resources :post, as: :post
  get "/blog/new", to: "post#new", as: :new_post
  get "/blog/:id", to: "post#show", as: :post
  patch "/blog/:id", to: "post#update"
  delete "/blog/:id", to: "post#destroy"
  get "/blog/:id/edit", to: "post#edit", as: :edit_post
  post "/blog/create", to: "post#create", as: :posts
end
