Rails.application.routes.draw do
  resources :todos
  resources :projects do
    resources :tasks, except: :index
  end

  resources :collaborators, except: :new
  get 'signup'    => "collaborators#new"

  get 'login'     => "sessions#new"
  post 'login'    => "sessions#create"
  delete 'logout' => "sessions#destroy"

  root "landing_pages#index"
end
