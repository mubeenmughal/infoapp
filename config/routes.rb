Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  devise_for :users
  
  root "personal_data#index"
  resources :personal_data
  resources :employments, only: %i[index show new create edit update destroy]
  
end
