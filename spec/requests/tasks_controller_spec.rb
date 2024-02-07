require 'rails_helper'

RSpec.describe TasksController do
  let(:project) { projects(:coolab) }
  let(:task) { tasks(:hotwire) }
  let(:collaborator) { collaborators(:miranto) }

  before do
    post login_path, params: { email: collaborator.email, password: 'miranto' }
  end

  describe 'GET #new' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get new_project_task_path(project)
        expect(response).to have_http_status(:ok)
      end

      it 'returns new task page' do
        get new_project_task_path(project)
        expect(response.body).to include('Create Task')
      end
    end
  end

  describe 'GET #show' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get project_task_path(project, task)
        expect(response).to have_http_status(:ok)
      end

      it 'returns task page' do
        get project_task_path(project, task)
        expect(response.body).to include(project.name)
      end
    end
  end

  describe 'GET #edit' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get edit_project_task_path(project, task)
        expect(response).to have_http_status(:ok)
      end

      it 'returns edit task page' do
        get edit_project_task_path(project, task)
        expect(response.body).to include(project.name)
      end
    end
  end

  describe 'POST #create' do
    context 'when logged in' do
      it 'redirects to project page after successfully save' do
        post project_tasks_path(project), params: { task: { name: 'Task', project_id: project.id } }
        expect(response).to redirect_to(project_tasks_url(project))
      end
    end
  end

  describe 'PATCH #update' do
    context 'when logged in' do
      it 'redirects to project page after successfully update' do
        patch project_task_path(project, task), params: { task: { name: 'Task update' } }
        expect(response).to redirect_to(project_path(project))
      end
    end
  end

  describe 'DELETE #destroy' do
    context 'when logged in' do
      it 'redirects to project page after successfully delete' do
        delete project_task_path(project, task)
        expect(response).to redirect_to(project_path(project))
      end
    end
  end
end