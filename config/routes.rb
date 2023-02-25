Rails.application.routes.draw do
  resources :projects do
    resources :tasks, except: :index do
      resources :todos, except: :index
    end
    resources :comments
  end

  resources :collaborators, except: :new
  get 'signup'    => "collaborators#new"

  get 'login'     => "sessions#new"
  post 'login'    => "sessions#create"
  delete 'logout' => "sessions#destroy"

  root "landing_pages#index"
end
