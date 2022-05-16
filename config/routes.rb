Rails.application.routes.draw do
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'movies#index'
  resources :movies do
    resources :reviews
    resources :favorites, only: [:create, :destroy]
  end
  get "signup", to: "users#new"
  get "signin", to: "sessions#new"
  get "signout", to: "sessions#destroy"
  resources :users
  resource :session, only: [:new, :create, :destroy]
end
