Rails.application.routes.draw do
  resources :collaborators
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "landing_pages#index"
end
