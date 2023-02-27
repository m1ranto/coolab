Rails.application.routes.draw do
  resources :projects do
    resources :tasks, except: :index do
      resources :todos, except: :index
    end
    resources :comments, only: %i[ index create destroy ]
  end

  resources :collaborators, except: :new
  get 'signup'    => "collaborators#new"
  post 'invite'   => "collaborators#invite"

  get 'login'     => "sessions#new"
  post 'login'    => "sessions#create"
  delete 'logout' => "sessions#destroy"

  root "landing_pages#index"
end
