Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "post#index"

  get "/blog/new", to: "post#new", as: :new_post
  get "/blog/:id", to: "post#show", as: :post
  post "/blog/create", to: "post#create", as: :posts
end
