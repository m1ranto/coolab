Rails.application.routes.draw do
  resources :collaborators

  get 'sign-up'   => "collaborators#new"
  get 'login'     => "sessions#new"
  post 'login'    => "sessions#create"
  delete 'logout' => "sessions#destroy"

  root "landing_pages#index"
end
