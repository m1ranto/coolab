Rails.application.routes.draw do
  patch '/projects/:project_id/tasks/:task_id/todos/:id/done' => "todos#done", as: 'done_todo'

  resources :projects do
    resources :tasks, except: :index do
      resources :todos, except: :index
    end
    resources :comments, only: %i[ index create destroy ]
  end

  resources :organizations

  resources :collaborators, except: :new
  get 'signup'    => "collaborators#new"
  post 'invite'   => "collaborators#invite"

  get 'login'     => "sessions#new"
  post 'login'    => "sessions#create"
  delete 'logout' => "sessions#destroy"

  root "landing_pages#index"

  get 'issues' => "tasks#index"
end
