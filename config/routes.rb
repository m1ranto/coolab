Rails.application.routes.draw do
  resources :projects

  resources :collaborators, except: :new
  get 'signup'    => "collaborators#new"

  get 'login'     => "sessions#new"
  post 'login'    => "sessions#create"
  delete 'logout' => "sessions#destroy"

  root "landing_pages#index"
end
