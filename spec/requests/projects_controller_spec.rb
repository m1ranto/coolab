require 'rails_helper'

RSpec.describe ProjectsController do
  fixtures :all

  let(:project) { projects(:coolab) }
  let(:collaborator) { collaborators(:miranto) }

  before do
    post login_path, params: { email: collaborator.email, password: 'miranto' }
  end

  describe 'GET #index' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get projects_path
        expect(response).to have_http_status(:ok)
      end

      it 'returns all projects' do
        get projects_path
        expect(response.body).to include('New project')
      end
    end
  end

  describe 'GET #show' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get project_path(project)
        expect(response).to have_http_status(:ok)
      end

      it 'returns a project' do
        get project_path(project)
        expect(response.body).to include(project.name)
      end
    end
  end

  describe 'GET #new' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get new_project_path
        expect(response).to have_http_status(:ok)
      end

      it 'returns new project page' do
        get new_project_path
        expect(response.body).to include('Name')
      end
    end
  end

  describe 'POST #create' do
    context 'when logged in' do
      it 'redirects to project page after successfully save' do
        post projects_path, params: { project: { name: 'Project', description: 'Description', collaborator_id: collaborator.id } }
        expect(response).to redirect_to project_path(Project.last)
      end
    end
  end

  describe 'GET #edit' do
    context 'when logged in' do
      it 'responds with a status 200 (OK)' do
        get edit_project_path(project)
        expect(response).to have_http_status(:ok)
      end

      it 'returns edit project page' do
        get edit_project_path(project)
        expect(response.body).to include(project.name)
      end
    end
  end

  describe 'PATCH #update' do
    it 'redirects to project page after successfully update' do
      patch project_path(project), params: { project: { name: 'Project update' } }
      expect(response).to redirect_to(project_path(project))
    end
  end

  describe 'DELETE #destroy' do
    it 'redirects to projects page after successfully delete' do
      delete project_path(project)
      expect(response).to redirect_to(projects_path)
    end
  end
end