Rails.application.routes.draw do
  devise_for :users
  root to: "grandmas#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :grandmas
  # Defines the root path route ("/")
  # root "articles#index"
end
