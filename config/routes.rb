Rails.application.routes.draw do
  resources :collaborators
  get '/sign-up' => "collaborators#new"

  root "landing_pages#index"
end
