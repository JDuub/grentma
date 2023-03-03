Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"
  resources :grandmas do
    resources :bookings
  end
  get 'search_grandmas', to: 'grandmas#search', as: 'search_grandmas'
end
