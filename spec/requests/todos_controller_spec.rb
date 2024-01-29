require 'rails_helper'

RSpec.describe TodosController do
  let(:project) { projects(:coolab) }
  let(:task) { tasks(:hotwire) }
  let(:todo) { todos(:add_turbo_and_stimulus) }
  let(:collaborator) { collaborators(:miranto) }

  before do
    post login_path, params: { email: collaborator.email, password: 'miranto' }
  end

  describe 'GET #new' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get new_project_task_todo_path(project, task)
        expect(response).to have_http_status(:ok)
      end

      it 'returns new task page' do
        get new_project_task_todo_path(project, task)
        expect(response.body).to include('Create Todo')
      end
    end
  end

  describe 'GET #show' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get project_task_todo_path(project, task, todo)
        expect(response).to have_http_status(:ok)
      end

      it 'returns task page' do
        get project_task_todo_path(project, task, todo)
        expect(response.body).to include(todo.name)
      end
    end
  end

  describe 'GET #edit' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get edit_project_task_todo_path(project, task, todo)
        expect(response).to have_http_status(:ok)
      end

      it 'returns edit task page' do
        get edit_project_task_todo_path(project, task, todo)
        expect(response.body).to include(todo.name)
      end
    end
  end

  describe 'POST #create' do
    context 'when logged in' do
      it 'redirects to project page after successfully save' do
        post project_task_todos_path(project, task), params: { todo: { name: 'Todo', task_id: task.id } }
        expect(response).to redirect_to(project_task_todo_path(project, task, Todo.last))
      end
    end
  end

  describe 'PATCH #update' do
    context 'when logged in' do
      it 'redirects to project page after successfully update' do
        patch project_task_todo_path(project, task, todo), params: { todo: { name: 'Todo update' } }
        expect(response).to redirect_to(project_task_todo_path(project, task, todo))
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when logged in' do
      it 'redirects to project page after successfully delete' do
        delete project_task_todo_path(project, task, todo)
        expect(response).to redirect_to(project_task_path(project, task))
      end
    end
  end
end