Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :personal_data
  resources :employments, only: %i[index show new create edit update destroy]
  root "personal_data#index"
end
