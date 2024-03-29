Rails.application.routes.draw do
  patch '/projects/:project_id/tasks/:task_id/todos/:id/done' => "todos#done", as: 'done_todo'
  patch '/projects/:project_id/tasks/:task_id/todos/:id/assign' => "todos#assign", as: 'assign_todo'

  resources :projects do
    resources :documents

    resources :tasks do
      resources :todos, except: :index
    end
    resources :comments, only: %i[ index create destroy ]
  end

  resources :organizations, only: %i[ edit update destroy ]
  get 'organizations/:id/invite'   => "organizations#invite", as: "organization_invite"
  get 'organizations/:id/join/:invitation_id'   => "organizations#join", as: "organization_join"

  resources :collaborators, except: :new
  get 'signup'    => "collaborators#new"
  post 'invite'   => "collaborators#invite"

  get 'login'     => "sessions#new"
  post 'login'    => "sessions#create"
  delete 'logout' => "sessions#destroy"

  root "landing_pages#index"

  get 'activity' => "todos#activity"
end
