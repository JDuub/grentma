Rails.application.routes.draw do
  devise_for :users
  root to: "grandmas#index"
  resources :grandmas do
    resources :bookings
  end
end
